% 
%	Name - Tommy Walton
%	Course - AC41011 Big Data
% 	Code 2 - Unique List Display
%

%Declare list module and export functions
-module(list).
-export([listInput/0]).
-export([organise/1]).
-export([filter/1]).
-export([arraySize/1]).
-export([displayInfo/1]).
-export([loadFile/1]).
-export([loadInput/0]).

%Loads in hamlet into the loadFile function
loadInput() -> loadFile("hamlet.txt").

%Loads a file to be read into a list
loadFile(FileInput)-> 
{ok, List} = file:read_file(FileInput),
	BinaryList = binary_to_list(List),
	%Strips special characters and whitespace to seperate into individual words
	ListNoSpecialCharacters = string:tokens(string:to_lower(BinaryList),"\r\n-,:';[].?!()_*#/£$% "),
	%Filters list for repeated words and displays information to screen
	FinalOutput = displayInfo(filter(ListNoSpecialCharacters)),
	FinalOutput.	

%Gives pre-set input to input, filtering, sorting and displaying the list
listInput() -> InputList = [2,5,3,6,3,2,7,8,5,6],displayInfo(organise(filter(InputList))).

%Quicksort to organise list order
organise([Head|Tail]) -> 
	organise([NewList || NewList <- Tail, NewList < Head]) ++
	[Head] ++
	organise([NewList || NewList <- Tail, NewList >= Head]);
organise(List) -> List.

%Displays the final information on screen on the unique values in list and amount of unique values
displayInfo(DisplayList) -> io:format("List: ~p ~nUnique In List Total: ~p~n", [DisplayList,arraySize(DisplayList)]).

%Removes any characters already present within list
filter([]) -> [];
filter([Head|Tail]) -> [Head | [FilteredList || FilteredList <- filter(Tail), FilteredList /= Head]].

%Returns the size of list
arraySize(List) -> length(List).









