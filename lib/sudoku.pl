sudoku(Cells) :-
  Cells =
  [
      [A1,A2,A3,A4],
      [B1,B2,B3,B4],
      [C1,C2,C3,C4],
      [D1,D2,D3,D4]
  ],

  Possible = [1,2,3,4],

  pick_value(Possible, Possible, A1, RowA_234, Col1_BCD),
  pick_value(RowA_234, Possible, A2, RowA__34, Col2_BCD),
  pick_value(RowA__34, Possible, A3, RowA___4, Col3_BCD),
  pick_value(RowA___4, Possible, A4, _RowA___, Col4_BCD),

  pick_value(Possible, Col1_BCD, B1, RowB_234, Col1__CD), A2 \= B1,
  pick_value(RowB_234, Col2_BCD, B2, RowB__34, Col2__CD), A1 \= B2,
  pick_value(RowB__34, Col3_BCD, B3, RowB___4, Col3__CD), A4 \= B3,
  pick_value(RowB___4, Col4_BCD, B4, _RowB___, Col4__CD), A3 \= B4,

  pick_value(Possible, Col1__CD, C1, RowC_234, Col1___D),
  pick_value(RowC_234, Col2__CD, C2, RowC__34, Col2___D),
  pick_value(RowC__34, Col3__CD, C3, RowC___4, Col3___D),
  pick_value(RowC___4, Col4__CD, C4, _RowC___, Col4___D),

  pick_value(Possible, Col1___D, D1, RowD_234, _), C2 \= D1,
  pick_value(RowD_234, Col2___D, D2, RowD__34, _), C1 \= D2,
  pick_value(RowD__34, Col3___D, D3, RowD___4, _), C4 \= D3,
  pick_value(RowD___4, Col4___D, D4, _RowD___, _), C3 \= D4,

  true.

pick_value(RowVals, ColVals, Value, RowValRest, ColValRest) :-
   pickValue(RowVals, Value, RowValRest),
   pickValue(ColVals, Value, ColValRest).

pickValue([H|Rest], H, Rest).
pickValue([H|Tail], Picked, [H|Rest]) :- pickValue(Tail, Picked, Rest).

solve(L) :-
    L = [ [  _, _, _, _  ], [  _, _, _, _  ], [  _, _, _, _  ], [  _, _, _, _  ] ],
    sudoku(L).
