Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Robot))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Robot))==(Machine(Robot));
  Level(Machine(Robot))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Robot)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Robot))==(Maze)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Robot))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Robot))==(?);
  List_Includes(Machine(Robot))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Robot))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Robot))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Robot))==(?);
  Context_List_Variables(Machine(Robot))==(?);
  Abstract_List_Variables(Machine(Robot))==(?);
  Local_List_Variables(Machine(Robot))==(visited,currentPosition,robotInY,robotInX);
  List_Variables(Machine(Robot))==(visited,currentPosition,robotInY,robotInX);
  External_List_Variables(Machine(Robot))==(visited,currentPosition,robotInY,robotInX)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Robot))==(?);
  Abstract_List_VisibleVariables(Machine(Robot))==(?);
  External_List_VisibleVariables(Machine(Robot))==(?);
  Expanded_List_VisibleVariables(Machine(Robot))==(?);
  List_VisibleVariables(Machine(Robot))==(?);
  Internal_List_VisibleVariables(Machine(Robot))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Robot))==(btrue);
  Gluing_List_Invariant(Machine(Robot))==(btrue);
  Expanded_List_Invariant(Machine(Robot))==(btrue);
  Abstract_List_Invariant(Machine(Robot))==(btrue);
  Context_List_Invariant(Machine(Robot))==(btrue);
  List_Invariant(Machine(Robot))==(robotInX: width & robotInY: height & currentPosition: maze & visited: seq(maze))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Robot))==(btrue);
  Abstract_List_Assertions(Machine(Robot))==(btrue);
  Context_List_Assertions(Machine(Robot))==(btrue);
  List_Assertions(Machine(Robot))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Robot))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Robot))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Robot))==(robotInX,robotInY,currentPosition,visited:=1,1,1|->1,[1|->1]);
  Context_List_Initialisation(Machine(Robot))==(skip);
  List_Initialisation(Machine(Robot))==(robotInX:=1 || robotInY:=1 || currentPosition:=1|->1 || visited:=[1|->1])
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Robot))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Robot),Machine(Maze))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Robot))==(btrue);
  List_Constraints(Machine(Robot))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Robot))==(MoveNorth,MoveSouth,MoveEast,MoveWest,Teleport,getPosition,foundExit,hasVisitedSquare,robotsRoute,Reset);
  List_Operations(Machine(Robot))==(MoveNorth,MoveSouth,MoveEast,MoveWest,Teleport,getPosition,foundExit,hasVisitedSquare,robotsRoute,Reset)
END
&
THEORY ListInputX IS
  List_Input(Machine(Robot),MoveNorth)==(?);
  List_Input(Machine(Robot),MoveSouth)==(?);
  List_Input(Machine(Robot),MoveEast)==(?);
  List_Input(Machine(Robot),MoveWest)==(?);
  List_Input(Machine(Robot),Teleport)==(teleportX,teleportY);
  List_Input(Machine(Robot),getPosition)==(?);
  List_Input(Machine(Robot),foundExit)==(?);
  List_Input(Machine(Robot),hasVisitedSquare)==(visitedXPlace,visitedYPlace);
  List_Input(Machine(Robot),robotsRoute)==(?);
  List_Input(Machine(Robot),Reset)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Robot),MoveNorth)==(output);
  List_Output(Machine(Robot),MoveSouth)==(output);
  List_Output(Machine(Robot),MoveEast)==(output);
  List_Output(Machine(Robot),MoveWest)==(output);
  List_Output(Machine(Robot),Teleport)==(output);
  List_Output(Machine(Robot),getPosition)==(position);
  List_Output(Machine(Robot),foundExit)==(exit);
  List_Output(Machine(Robot),hasVisitedSquare)==(visitedSquare);
  List_Output(Machine(Robot),robotsRoute)==(route);
  List_Output(Machine(Robot),Reset)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Robot),MoveNorth)==(output <-- MoveNorth);
  List_Header(Machine(Robot),MoveSouth)==(output <-- MoveSouth);
  List_Header(Machine(Robot),MoveEast)==(output <-- MoveEast);
  List_Header(Machine(Robot),MoveWest)==(output <-- MoveWest);
  List_Header(Machine(Robot),Teleport)==(output <-- Teleport(teleportX,teleportY));
  List_Header(Machine(Robot),getPosition)==(position <-- getPosition);
  List_Header(Machine(Robot),foundExit)==(exit <-- foundExit);
  List_Header(Machine(Robot),hasVisitedSquare)==(visitedSquare <-- hasVisitedSquare(visitedXPlace,visitedYPlace));
  List_Header(Machine(Robot),robotsRoute)==(route <-- robotsRoute);
  List_Header(Machine(Robot),Reset)==(Reset)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Robot),MoveNorth)==(output: MOVE);
  List_Precondition(Machine(Robot),MoveSouth)==(output: MOVE);
  List_Precondition(Machine(Robot),MoveEast)==(output: MOVE);
  List_Precondition(Machine(Robot),MoveWest)==(output: MOVE);
  List_Precondition(Machine(Robot),Teleport)==(output: TELEPORT & teleportX: NAT1 & teleportY: NAT1);
  List_Precondition(Machine(Robot),getPosition)==(btrue);
  List_Precondition(Machine(Robot),foundExit)==(exit: MOVE);
  List_Precondition(Machine(Robot),hasVisitedSquare)==(visitedSquare: MOVE & visitedXPlace: NAT1 & visitedYPlace: NAT1);
  List_Precondition(Machine(Robot),robotsRoute)==(btrue);
  List_Precondition(Machine(Robot),Reset)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Robot),Reset)==(btrue | robotInX,robotInY,visited,currentPosition:=1,1,[1|->1],1|->1);
  Expanded_List_Substitution(Machine(Robot),robotsRoute)==(btrue | route:=visited);
  Expanded_List_Substitution(Machine(Robot),hasVisitedSquare)==(visitedSquare: MOVE & visitedXPlace: NAT1 & visitedYPlace: NAT1 | visitedXPlace|->visitedYPlace: maze ==> (visitedXPlace|->visitedYPlace: ran(front(visited)) ==> visitedSquare:=yes [] not(visitedXPlace|->visitedYPlace: ran(front(visited))) ==> visitedSquare:=no) [] not(visitedXPlace|->visitedYPlace: maze) ==> visitedSquare:=Out_Of_Boundary);
  Expanded_List_Substitution(Machine(Robot),foundExit)==(exit: MOVE | currentPosition: exit_square ==> exit:=yes [] not(currentPosition: exit_square) ==> exit:=no);
  Expanded_List_Substitution(Machine(Robot),getPosition)==(btrue | position:=currentPosition);
  Expanded_List_Substitution(Machine(Robot),Teleport)==(output: TELEPORT & teleportX: NAT1 & teleportY: NAT1 | robotInX|->robotInY: exit_square ==> output:=Already_Teleported_To_Exit_Square [] not(robotInX|->robotInY: exit_square) ==> (teleportX|->teleportY: internal_walls ==> output:=Cannot_Teleport_Internal_Wall_Crash [] not(teleportX|->teleportY: internal_walls) ==> (teleportX = robotInX & teleportY = robotInY ==> output:=Cannot_Teleport_To_Same_Square [] not(teleportX = robotInX & teleportY = robotInY) ==> (teleportX|->teleportY/:maze ==> output:=Cannot_Teleport_Out_Of_Boundary [] not(teleportX|->teleportY/:maze) ==> visited,currentPosition,robotInX,robotInY,output:=visited<-(teleportX|->teleportY),teleportX|->teleportY,teleportX,teleportY,Successfully_Teleported))));
  Expanded_List_Substitution(Machine(Robot),MoveWest)==(output: MOVE | robotInX|->robotInY: exit_square ==> output:=Already_In_Exit_Square [] not(robotInX|->robotInY: exit_square) ==> (robotInX-1>max(width) ==> output:=Out_Of_Boundary [] not(robotInX-1>max(width)) ==> (robotInX-1|->robotInY: internal_walls ==> output:=Internal_Wall_Crash [] not(robotInX-1|->robotInY: internal_walls) ==> visited,currentPosition,robotInX,output:=visited<-(robotInX-1|->robotInY),robotInX-1|->robotInY,robotInX-1,Moved_To_West)));
  Expanded_List_Substitution(Machine(Robot),MoveEast)==(output: MOVE | robotInX|->robotInY: exit_square ==> output:=Already_In_Exit_Square [] not(robotInX|->robotInY: exit_square) ==> (robotInX+1|->robotInY: internal_walls ==> output:=Internal_Wall_Crash [] not(robotInX+1|->robotInY: internal_walls) ==> (robotInX+1>max(width) ==> output:=Out_Of_Boundary [] not(robotInX+1>max(width)) ==> visited,currentPosition,robotInX,output:=visited<-(robotInX+1|->robotInY),robotInX+1|->robotInY,robotInX+1,Moved_To_East)));
  Expanded_List_Substitution(Machine(Robot),MoveSouth)==(output: MOVE | robotInX|->robotInY: exit_square ==> output:=Already_In_Exit_Square [] not(robotInX|->robotInY: exit_square) ==> (robotInY-1>max(height) ==> output:=Out_Of_Boundary [] not(robotInY-1>max(height)) ==> (robotInX|->robotInY-1: internal_walls ==> output:=Internal_Wall_Crash [] not(robotInX|->robotInY-1: internal_walls) ==> visited,currentPosition,robotInY,output:=visited<-(robotInX|->robotInY-1),robotInX|->robotInY-1,robotInY-1,Moved_To_South)));
  Expanded_List_Substitution(Machine(Robot),MoveNorth)==(output: MOVE | robotInX|->robotInY: exit_square ==> output:=Already_In_Exit_Square [] not(robotInX|->robotInY: exit_square) ==> (robotInX|->robotInY+1: internal_walls ==> output:=Internal_Wall_Crash [] not(robotInX|->robotInY+1: internal_walls) ==> (robotInY+1>max(height) ==> output:=Out_Of_Boundary [] not(robotInY+1>max(height)) ==> visited,currentPosition,robotInY,output:=visited<-(robotInX|->robotInY+1),robotInX|->robotInY+1,robotInY+1,Moved_To_North)));
  List_Substitution(Machine(Robot),MoveNorth)==(IF robotInX|->robotInY: exit_square THEN output:=Already_In_Exit_Square ELSIF robotInX|->robotInY+1: internal_walls THEN output:=Internal_Wall_Crash ELSIF robotInY+1>max(height) THEN output:=Out_Of_Boundary ELSE visited:=visited<-(robotInX|->robotInY+1) || currentPosition:=robotInX|->robotInY+1 || robotInY:=robotInY+1 || output:=Moved_To_North END);
  List_Substitution(Machine(Robot),MoveSouth)==(IF robotInX|->robotInY: exit_square THEN output:=Already_In_Exit_Square ELSIF robotInY-1>max(height) THEN output:=Out_Of_Boundary ELSIF robotInX|->robotInY-1: internal_walls THEN output:=Internal_Wall_Crash ELSE visited:=visited<-(robotInX|->robotInY-1) || currentPosition:=robotInX|->robotInY-1 || robotInY:=robotInY-1 || output:=Moved_To_South END);
  List_Substitution(Machine(Robot),MoveEast)==(IF robotInX|->robotInY: exit_square THEN output:=Already_In_Exit_Square ELSIF robotInX+1|->robotInY: internal_walls THEN output:=Internal_Wall_Crash ELSIF robotInX+1>max(width) THEN output:=Out_Of_Boundary ELSE visited:=visited<-(robotInX+1|->robotInY) || currentPosition:=robotInX+1|->robotInY || robotInX:=robotInX+1 || output:=Moved_To_East END);
  List_Substitution(Machine(Robot),MoveWest)==(IF robotInX|->robotInY: exit_square THEN output:=Already_In_Exit_Square ELSIF robotInX-1>max(width) THEN output:=Out_Of_Boundary ELSIF robotInX-1|->robotInY: internal_walls THEN output:=Internal_Wall_Crash ELSE visited:=visited<-(robotInX-1|->robotInY) || currentPosition:=robotInX-1|->robotInY || robotInX:=robotInX-1 || output:=Moved_To_West END);
  List_Substitution(Machine(Robot),Teleport)==(IF robotInX|->robotInY: exit_square THEN output:=Already_Teleported_To_Exit_Square ELSIF teleportX|->teleportY: internal_walls THEN output:=Cannot_Teleport_Internal_Wall_Crash ELSIF teleportX = robotInX & teleportY = robotInY THEN output:=Cannot_Teleport_To_Same_Square ELSIF teleportX|->teleportY/:maze THEN output:=Cannot_Teleport_Out_Of_Boundary ELSE visited:=visited<-(teleportX|->teleportY) || currentPosition:=teleportX|->teleportY || robotInX:=teleportX || robotInY:=teleportY || output:=Successfully_Teleported END);
  List_Substitution(Machine(Robot),getPosition)==(position:=currentPosition);
  List_Substitution(Machine(Robot),foundExit)==(IF currentPosition: exit_square THEN exit:=yes ELSE exit:=no END);
  List_Substitution(Machine(Robot),hasVisitedSquare)==(IF visitedXPlace|->visitedYPlace: maze THEN IF visitedXPlace|->visitedYPlace: ran(front(visited)) THEN visitedSquare:=yes ELSE visitedSquare:=no END ELSE visitedSquare:=Out_Of_Boundary END);
  List_Substitution(Machine(Robot),robotsRoute)==(route:=visited);
  List_Substitution(Machine(Robot),Reset)==(robotInX,robotInY,visited,currentPosition:=1,1,[1|->1],1|->1)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Robot))==(?);
  Inherited_List_Constants(Machine(Robot))==(?);
  List_Constants(Machine(Robot))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Robot),MOVE)==({Already_In_Exit_Square,Moved_To_North,Moved_To_South,Moved_To_East,Moved_To_West,Internal_Wall_Crash,Out_Of_Boundary,yes,no});
  Context_List_Enumerated(Machine(Robot))==(?);
  Context_List_Defered(Machine(Robot))==(?);
  Context_List_Sets(Machine(Robot))==(?);
  List_Valuable_Sets(Machine(Robot))==(?);
  Inherited_List_Enumerated(Machine(Robot))==(?);
  Inherited_List_Defered(Machine(Robot))==(?);
  Inherited_List_Sets(Machine(Robot))==(?);
  List_Enumerated(Machine(Robot))==(MOVE,TELEPORT);
  List_Defered(Machine(Robot))==(?);
  List_Sets(Machine(Robot))==(MOVE,TELEPORT);
  Set_Definition(Machine(Robot),TELEPORT)==({Successfully_Teleported,Cannot_Teleport_To_Same_Square,Cannot_Teleport_Internal_Wall_Crash,Cannot_Teleport_Out_Of_Boundary,Already_Teleported_To_Exit_Square})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Robot))==(?);
  Expanded_List_HiddenConstants(Machine(Robot))==(?);
  List_HiddenConstants(Machine(Robot))==(?);
  External_List_HiddenConstants(Machine(Robot))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Robot))==(btrue);
  Context_List_Properties(Machine(Robot))==(width <: NAT1 & width = 1..7 & height <: NAT1 & height = 1..5 & maze: width <-> height & maze = width*height & internal_walls: width <-> height & internal_walls = {2|->1,6|->1,4|->2,6|->2,1|->3,2|->3,3|->3,4|->3,4|->4,6|->4,7|->4,2|->5} & entrance_square = {1|->1} & exit_square = {1|->5});
  Inherited_List_Properties(Machine(Robot))==(btrue);
  List_Properties(Machine(Robot))==(MOVE: FIN(INTEGER) & not(MOVE = {}) & TELEPORT: FIN(INTEGER) & not(TELEPORT = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Robot),Machine(Maze))==(?);
  Seen_Context_List_Enumerated(Machine(Robot))==(?);
  Seen_Context_List_Invariant(Machine(Robot))==(btrue);
  Seen_Context_List_Assertions(Machine(Robot))==(btrue);
  Seen_Context_List_Properties(Machine(Robot))==(btrue);
  Seen_List_Constraints(Machine(Robot))==(btrue);
  Seen_List_Operations(Machine(Robot),Machine(Maze))==(?);
  Seen_Expanded_List_Invariant(Machine(Robot),Machine(Maze))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Robot),MoveNorth)==(?);
  List_ANY_Var(Machine(Robot),MoveSouth)==(?);
  List_ANY_Var(Machine(Robot),MoveEast)==(?);
  List_ANY_Var(Machine(Robot),MoveWest)==(?);
  List_ANY_Var(Machine(Robot),Teleport)==(?);
  List_ANY_Var(Machine(Robot),getPosition)==(?);
  List_ANY_Var(Machine(Robot),foundExit)==(?);
  List_ANY_Var(Machine(Robot),hasVisitedSquare)==(?);
  List_ANY_Var(Machine(Robot),robotsRoute)==(?);
  List_ANY_Var(Machine(Robot),Reset)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Robot)) == (MOVE,TELEPORT,Already_In_Exit_Square,Moved_To_North,Moved_To_South,Moved_To_East,Moved_To_West,Internal_Wall_Crash,Out_Of_Boundary,yes,no,Successfully_Teleported,Cannot_Teleport_To_Same_Square,Cannot_Teleport_Internal_Wall_Crash,Cannot_Teleport_Out_Of_Boundary,Already_Teleported_To_Exit_Square | ? | visited,currentPosition,robotInY,robotInX | ? | MoveNorth,MoveSouth,MoveEast,MoveWest,Teleport,getPosition,foundExit,hasVisitedSquare,robotsRoute,Reset | ? | seen(Machine(Maze)) | ? | Robot);
  List_Of_HiddenCst_Ids(Machine(Robot)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Robot)) == (?);
  List_Of_VisibleVar_Ids(Machine(Robot)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Robot)) == (?: ?);
  List_Of_Ids(Machine(Maze)) == (entrance_square,exit_square,width,height,internal_walls,maze | ? | ? | ? | ? | ? | ? | ? | Maze);
  List_Of_HiddenCst_Ids(Machine(Maze)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Maze)) == (entrance_square,exit_square,width,height,internal_walls,maze);
  List_Of_VisibleVar_Ids(Machine(Maze)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Maze)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Robot)) == (Type(MOVE) == Cst(SetOf(etype(MOVE,0,8)));Type(TELEPORT) == Cst(SetOf(etype(TELEPORT,0,4))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Robot)) == (Type(Already_In_Exit_Square) == Cst(etype(MOVE,0,8));Type(Moved_To_North) == Cst(etype(MOVE,0,8));Type(Moved_To_South) == Cst(etype(MOVE,0,8));Type(Moved_To_East) == Cst(etype(MOVE,0,8));Type(Moved_To_West) == Cst(etype(MOVE,0,8));Type(Internal_Wall_Crash) == Cst(etype(MOVE,0,8));Type(Out_Of_Boundary) == Cst(etype(MOVE,0,8));Type(yes) == Cst(etype(MOVE,0,8));Type(no) == Cst(etype(MOVE,0,8));Type(Successfully_Teleported) == Cst(etype(TELEPORT,0,4));Type(Cannot_Teleport_To_Same_Square) == Cst(etype(TELEPORT,0,4));Type(Cannot_Teleport_Internal_Wall_Crash) == Cst(etype(TELEPORT,0,4));Type(Cannot_Teleport_Out_Of_Boundary) == Cst(etype(TELEPORT,0,4));Type(Already_Teleported_To_Exit_Square) == Cst(etype(TELEPORT,0,4)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Robot)) == (Type(visited) == Mvl(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))));Type(currentPosition) == Mvl(btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(robotInY) == Mvl(btype(INTEGER,?,?));Type(robotInX) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Robot)) == (Type(Reset) == Cst(No_type,No_type);Type(robotsRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(hasVisitedSquare) == Cst(etype(MOVE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(foundExit) == Cst(etype(MOVE,?,?),No_type);Type(getPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(Teleport) == Cst(etype(TELEPORT,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(MoveWest) == Cst(etype(MOVE,?,?),No_type);Type(MoveEast) == Cst(etype(MOVE,?,?),No_type);Type(MoveSouth) == Cst(etype(MOVE,?,?),No_type);Type(MoveNorth) == Cst(etype(MOVE,?,?),No_type));
  Observers(Machine(Robot)) == (Type(robotsRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(hasVisitedSquare) == Cst(etype(MOVE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(foundExit) == Cst(etype(MOVE,?,?),No_type);Type(getPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
