-module(temperatures).
-export([format_temps/1, format_temps_improved/1]).

format_temps_improved(List_of_cities) ->
    Converted_List = convert_list_to_c(List_of_cities),
    print_temp_improved(Converted_List),
    {Max_city, Min_city} = find_max_and_min(Converted_List),
    print_max_and_min(Max_city, Min_city).

format_temps([]) ->
    ok;
format_temps([City | Tail]) ->
    print_temp(convert_to_celsius(City)),
    format_temps(Tail).

convert_to_celsius({Name, { c, Temp }}) ->
    {Name, { c, Temp }};
convert_to_celsius({Name, {f, Temp}}) ->
    {Name, {c, (Temp - 32) * 5 / 9}}.

print_temp({ Name, { c, Temp } }) ->
    io:format("~-15w ~w c~n", [Name, Temp]).


% Extracts Name and temperature in Farenheit(F)
% and does the conversion in place, assigning it
% to the Converted_City variable and adding it
% to the result list.
convert_list_to_c([{ Name, {f, F}} | Rest]) ->
    Converted_City = { Name, {c, (F - 32) * 5 / 9}},
    [Converted_City | convert_list_to_c(Rest)];
% If the above didn't match that means the temperature
% is already in Celsius, then we just add it to the resulting
% list.
convert_list_to_c([City | Rest]) ->
    [City | convert_list_to_c(Rest)];
% We're done, just return and empty list to enable the concatenation
% operator (|) to do its job.
convert_list_to_c([]) ->
    [].

print_temp_improved([{ Name, { c, Temp } } | Rest]) ->
    io:format("~-15w ~w c~n", [Name, Temp]),
    print_temp_improved(Rest);
print_temp_improved([]) ->
    ok.

% Now we need a function to figure the Cities with maximum and minimun 
% temperatures. Let's see...

% Extract the first City in the list, we will use it as our first 
% value for both Maximum and Minimum
find_max_and_min([City | Rest]) ->
    find_max_and_min(Rest, City, City).

% From the Head (which is a City) extract the Name and the 
% Temperature and do the calculations.
find_max_and_min([{Name, {c, Temp}} | Rest], 
         {Max_Name, {c, Max_Temp}}, 
         {Min_Name, {c, Min_Temp}}) ->
    if Temp > Max_Temp ->
           Max_City = {Name, { c, Temp }};      % We have a new max
       true ->
           Max_City = {Max_Name, {c, Max_Temp}} % Max didn't change
    end,
    if Temp < Min_Temp ->
           Min_City = {Name, { c, Temp }};      % We have a new min
       true ->
           Min_City = {Min_Name, {c, Min_Temp}} % Min didn't change
    end,
    find_max_and_min(Rest, Max_City, Min_City);

% When we reach the end of the list return the Max and Min 
% we calculated previously.
find_max_and_min([], Max_City, Min_City) -> 
    { Max_City, Min_City }.

print_max_and_min({Max_name, {c, Max_temp}}, {Min_name, {c, Min_temp}}) ->
    io:format("Max temperature was ~w c in ~w~n", [Max_temp, Max_name]),
    io:format("Min temperature was ~w c in ~w~n", [Min_temp, Min_name]).
