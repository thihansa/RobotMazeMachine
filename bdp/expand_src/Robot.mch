/* Robot
 * Author: Thihansa Mudalige
 * Creation date: 12/24/2022
 */
MACHINE
    Robot

SEES
    Maze

SETS
    MOVE = { Already_In_Exit_Square , Moved_To_North , Moved_To_South , Moved_To_East , Moved_To_West , Internal_Wall_Crash , Out_Of_Boundary , yes , no } ;
    TELEPORT = { Successfully_Teleported , Cannot_Teleport_To_Same_Square , Cannot_Teleport_Internal_Wall_Crash , Cannot_Teleport_Out_Of_Boundary , Already_Teleported_To_Exit_Square }

ABSTRACT_VARIABLES
    robotInX ,
    robotInY ,
    currentPosition ,
    visited

INVARIANT
    robotInX : width & //robot's x position is within the width range 1 to 7
    robotInY : height & //robot's y position is within the width range 1 to 5
    currentPosition : maze & //the current position o the robot which an element of the maze 
    visited : seq ( maze ) //squares tat have been visited by the robot is stored in a sequence of maze elements

INITIALISATION
    //initializes all the variables with the initial square (1,1)
    robotInX := 1 ||
    robotInY := 1 ||
    currentPosition := ( 1 |-> 1 ) ||
    visited := [ ( 1 |-> 1 ) ]

DEFINITIONS
    // Animation functions
    ANIMATION_FUNCTION == ( { row , col , i | col : 1 .. 7 & row : 1 .. 5 & i = 0 } ) ;
    ANIMATION_FUNCTION1 == ( { row , col , i | col : 1 .. 7 & row : 1 .. 5 & i = 1 & ( col , 6 - row ) : internal_walls } ) ;
    ANIMATION_FUNCTION2 == ( { row , col , i | col : 1 .. 7 & row : 1 .. 5 & i = 2 & col = robotInX & row = ( 6 - robotInY ) } ) ;


    ANIMATION_IMG0 == "images/block.gif" ;
    ANIMATION_IMG1 == "images/wall.gif" ;
    ANIMATION_IMG2 == "images/robot.gif"

OPERATIONS

    output <-- MoveNorth =
        PRE  output : MOVE
        THEN
            IF ( ( robotInX |-> robotInY ) : exit_square )
            THEN
                output := Already_In_Exit_Square
            ELSIF ( ( robotInX |-> robotInY + 1 ) : internal_walls ) //checks if the above square is an element of internal_walls
            THEN
                output := Internal_Wall_Crash
            ELSIF ( robotInY + 1 > max ( height ) ) //checks if the above position is within the height range
            THEN
                output := Out_Of_Boundary
            ELSE
                visited := ( visited <- ( robotInX |-> robotInY + 1 ) ) ||
                currentPosition := ( robotInX |-> robotInY + 1 ) ||
                robotInY := robotInY + 1 ||
                output := Moved_To_North
            END
        END ;

     output <-- MoveSouth =
         PRE output : MOVE
         THEN
            IF ( ( robotInX |-> robotInY ) : exit_square )
            THEN
                output := Already_In_Exit_Square
            ELSIF ( robotInY - 1 > max ( height ) ) //checks if the below square is within the height range
            THEN
                output := Out_Of_Boundary
            ELSIF ( ( robotInX |-> robotInY - 1 ) : internal_walls ) //checks if the below square is an element of internal_walls
            THEN
                output := Internal_Wall_Crash
            ELSE
                visited := ( visited <- ( robotInX |-> robotInY - 1 ) ) ||
                currentPosition := ( robotInX |-> robotInY - 1 ) ||
                robotInY := robotInY - 1 ||
                output := Moved_To_South
            END
        END ;

     output <-- MoveEast =
         PRE output : MOVE
         THEN
            IF ( ( robotInX |-> robotInY ) : exit_square )
            THEN
                output := Already_In_Exit_Square
            ELSIF ( ( robotInX + 1 |-> robotInY ) : internal_walls ) //checks if the square to the right is an element of internal_walls
            THEN
                output := Internal_Wall_Crash
            ELSIF ( robotInX + 1 > max ( width ) ) //checks if the square to the right is within the width range
            THEN
                output := Out_Of_Boundary
            ELSE
                visited := ( visited <- ( robotInX + 1 |-> robotInY ) ) ||
                currentPosition := ( robotInX + 1 |-> robotInY ) ||
                robotInX := robotInX + 1 ||
                output := Moved_To_East
            END
        END ;

     output <-- MoveWest =
         PRE output : MOVE
         THEN
            IF ( ( robotInX |-> robotInY ) : exit_square )
            THEN
                output := Already_In_Exit_Square
            ELSIF ( robotInX - 1 > max ( width ) ) //checks if the square to the left is within the width range
            THEN
                output := Out_Of_Boundary
            ELSIF ( ( robotInX - 1 |-> robotInY ) : internal_walls ) //checks if the square to the left is an element of internal_walls
            THEN
                output := Internal_Wall_Crash
            ELSE
                visited := ( visited <- ( robotInX - 1 |-> robotInY ) ) ||
                currentPosition := ( robotInX - 1 |-> robotInY ) ||
                robotInX := robotInX - 1 ||
                output := Moved_To_West
            END
        END ;


     output <-- Teleport ( teleportX , teleportY ) =
         PRE output : TELEPORT & teleportX : NAT1 & teleportY : NAT1
         THEN
             IF ( ( robotInX |-> robotInY ) : exit_square )
             THEN
                output := Already_Teleported_To_Exit_Square
             ELSIF
                 ( ( teleportX |-> teleportY ) : internal_walls ) //stops the robot from being teleported to a internal wall
             THEN
                 output := Cannot_Teleport_Internal_Wall_Crash
             ELSIF teleportX = robotInX & teleportY = robotInY //stops the robot of being teleported to the same current square
             THEN
                 output := Cannot_Teleport_To_Same_Square
             ELSIF ( ( teleportX |-> teleportY ) /: maze ) //stops the robot being teleported to a square that is not an element of maze
             THEN
                 output := Cannot_Teleport_Out_Of_Boundary
             ELSE
                    visited := ( visited <- ( teleportX |-> teleportY ) ) ||
                    currentPosition := ( teleportX |-> teleportY ) ||
                    robotInX := teleportX ||
                    robotInY := teleportY ||
                    output := Successfully_Teleported
             END
         END ;

     position <-- getPosition =
         BEGIN
             position := currentPosition //outputs the current position of the robot
         END ;

     exit <-- foundExit =
         PRE exit : MOVE
         THEN
             IF ( currentPosition : exit_square ) //checks if the current position of the robot is the exit square
             THEN
                 exit := yes //in the exit square
             ELSE
                 exit := no //not in the exit square
             END
         END ;

     visitedSquare <-- hasVisitedSquare ( visitedXPlace , visitedYPlace ) =
         PRE visitedSquare : MOVE & visitedXPlace : NAT1 & visitedYPlace : NAT1
         THEN
             IF ( ( visitedXPlace |-> visitedYPlace ) : maze )
             THEN
                IF ( ( visitedXPlace |-> visitedYPlace ) : ran ( front ( visited ) ) )
                THEN
                      visitedSquare := yes
                ELSE
                      visitedSquare := no
                END
             ELSE
                 visitedSquare := Out_Of_Boundary
             END

          END ;

     route <-- robotsRoute =
         BEGIN
             route := visited //outputs the route of the robot
         END ;

     Reset =
         BEGIN
             robotInX , robotInY , visited , currentPosition := 1 , 1 , [ ( 1 |-> 1 ) ] , ( 1 |-> 1 ) //resets the robots journey
         END
END
