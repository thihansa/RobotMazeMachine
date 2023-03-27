/* Maze
 * Author: Thihansa Mudalige
 * Creation date: 12/24/2022
 */
MACHINE
    Maze
    
CONSTANTS
    entrance_square,
    exit_square,
    width,
    height,
    internal_walls,
    maze
      
PROPERTIES
    width <: NAT1 & width = 1..7 & //the width of the maze is restricted from 1 to 7 range
    height <: NAT1 & height = 1..5 & //the height of the maze is restricted from 1 to 5 range
    maze : width <-> height & //maze is an element of relation between width and height
    maze = width * height & //maze is the cartesian product of width and height
    internal_walls : width <-> height & //internal_walls is an element of relation between width and height
    internal_walls = { (2 |-> 1), (6 |-> 1), (4 |-> 2), (6 |-> 2), (1 |-> 3), (2 |-> 3), (3 |-> 3), (4 |-> 3), (4 |-> 4), (6 |-> 4), (7 |-> 4), (2 |-> 5) } & //internal walls defined
    entrance_square = {(1 |-> 1)} & //entrance_square defined
    exit_square = { (1 |-> 5) } //exit_square defined
    
END