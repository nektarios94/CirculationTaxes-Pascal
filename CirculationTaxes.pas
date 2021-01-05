Program Telh_Kukloforias; 


  { Synarthsh gia ton ypologismo telwn vasei ekpompwn CO2 }
function calcEdta (co2Em : integer) : real; { co2Em = CO2 Emissions }
var
    result : real;

begin
    
    if co2Em <= 90 then
        result := 0
    else if co2Em <= 100 then
        result:= co2Em * 0.9
    else if co2Em <= 120 then
        result:= co2Em * 0.98
    else if co2Em <= 140 then
        result:= co2Em * 1.2
    else if co2Em <= 160 then
        result:= co2Em * 1.85
    else if co2Em <= 180 then
        result:= co2Em * 2.45
    else if co2Em <= 200 then
        result:= co2Em * 2.78
    else if co2Em <= 250 then
        result:= co2Em * 3.05
    else 
        result:= co2Em * 3.72;
    calcEdta := result;
end;

  { Synarthsh gia ton ypologismo telwn vasei kyvismou }
function calcKy (y, kyv : integer): real;
var
    result : real;
    
begin

    if y <= 2000 then
        begin
            if kyv <= 300 then
                result := 22
            else if kyv <= 785 then
                result := 55
            else if kyv <= 1071 then
                result := 120
            else if kyv <= 1357 then
                result := 135
            else if kyv <= 1548 then
                result := 225
            else if kyv <= 1738 then
                result := 250
            else if kyv <= 1929 then
                result := 280
            else if kyv <= 2357 then
                result := 615
            else if kyv <= 3000 then
                result := 820
            else if kyv <= 4000 then
                result := 1025
            else 
                result := 1230
        end
    else if y <= 2005 then
        begin
            if kyv <= 300 then
                result := 22
            else if kyv <= 785 then
                result := 55
            else if kyv <= 1071 then
                result := 120
            else if kyv <= 1357 then
                result := 135
            else if kyv <= 1548 then
                result := 240
            else if kyv <= 1738 then
                result := 265
            else if kyv <= 1929 then
                result := 300
            else if kyv <= 2357 then
                result := 630
            else if kyv <= 3000 then
                result := 840
            else if kyv <= 4000 then
                result := 1050
            else 
                result := 1260
        end
    else
        begin
            if kyv <= 300 then
                result := 22
            else if kyv <= 785 then
                result := 55
            else if kyv <= 1071 then
                result := 120
            else if kyv <= 1357 then
                result := 135
            else if kyv <= 1548 then
                result := 255
            else if kyv <= 1738 then
                result := 280
            else if kyv <= 1929 then
                result := 320
            else if kyv <= 2357 then
                result := 690
            else if kyv <= 3000 then
                result := 920
            else if kyv <= 4000 then
                result := 1150
            else 
                result := 1380
        end;

    calcKy := result;
end;
    
  { Synarthsh elegxou: zhtaw arithmitikes times mexri na dwthei mia apodekth }
function validNum ( x, y : integer; str : string ) : integer;

begin
    repeat
        writeln (str);
        readln (x);
    until x > y;
    
    validNum := x;    
end;
 
{ METAVLHTES KYRIOY PROGRAMMATOS }
var 
    year, ky, edta : integer;
          veh_type : string;
               veh : char;
             total : real;
            
            
begin
    
    year := -1;
    ky := -1;
    total := -1;
    edta := -1;
    veh := 't'; {dinw mia tuxaia mh egkyrh taksinomhsh}
    veh_type := 'k';             { -\\-}
    
    writeln ('Parakalw dwste to etos taksinomhshs: ');
    year := validNum (year, 1885, 'H timh prepei megaluterh tou 1885: '); { 1886 = etos kykloforias tou prwtou autokinhtou }
    
    writeln ('Epilekste ton typo tou oxhmatos: D = motosykleta, C = aytokinhto ');
    writeln ('H'' plhktrologiste ''X'' gia termatismo tou programmatos. Ta grammata prepei na einai kefalaia: ');
    readln (veh);
    while (veh <> 'D') and (veh <> 'C') and (veh <> 'X') do 
        begin
            writeln ('Parakalw dwste mia egkyrh timh');
            readln (veh);
        end;

    if veh = 'X' then 
        begin
            writeln('TO PROGRAMMA TERMATISTIKE');
            exit; 
        end;
    
   
    writeln ('Epilekste to eidos tou oxhmatos: SY = Symvatiko, YB = Yvridiko: ');
    readln (veh_type);
    while (veh_type <> 'YB') and (veh_type <> 'SY') do 
        begin
            writeln ('Parakalw dwste mia egkyrh timh');
            readln (veh);
        end;

    writeln ('Dwste ton kyvismo tou oxhmatos sas: ');
    ky := validNum (ky, 0, 'H timh prepei megaluterh tou 0: ');
    
    if (veh_type = 'YB') and (ky <= 1548) then
        total := 0;

    if ((year < 2011) and (total <> 0)) or ((veh = 'D') and (total <> 0)) then
        begin
            total := calcKy ( year, ky ); { Ypologismos me vash ton kyvismo me th synarthsh calcKy }
        end
    else if (total <> 0) then
        begin
            writeln ('Dwste thn ekpomph CO2 tou oxhmatos sas: ');
            edta := validNum (edta, 0, 'H timh prepei megaluterh tou 0: ');
            total := calcEdta (edta); { Ypologismos me vash tis ekpompes me th synarthsh calcEdta } 
        end;
    
     if total = 0 then 
        writeln ('Apallasseste apo ta telh kukloforias gia to etos 2021')
    else
        begin
            if veh_type = 'YB' then
                total := total * 0.6;
            writeln ('Ta telh kykloforias pou prepei na katavalete einai ', total:6:2, '€');
        end;
    
end.
