musician(steve_vai, guitar).
musician(guthrie_govan, guitar).
musician(phil_collins, drums).
musician(robert_fripp, guitar).
musician(keith_emerson, synthesizer).
musician(greg_lake, guitar).
musician(john_petrucci, guitar).
musician(peter_townsend, guitar).
musician(jimmy_page, guitar).
musician(freddy_mercury, vocals).

genre(rock_n_roll, steve_vai).
genre(everything, guthrie_govan).
genre(progressive_metal, phil_collins).
genre(progressive_metal, robert_fripp).
genre(progressive_metal, keith_emerson).
genre(progressive_metal, greg_lake).
genre(progressive_metal, john_petrucci).
genre(rock_n_roll, peter_townsend).
genre(rock_n_roll, jimmy_page).
genre(rock_n_roll, freddy_mercury).

name_genre(N, G) :- musician(N, Z), genre(Z, G).
