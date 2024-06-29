pragma Ada_2022;

with Cars;
with Visitors;

procedure Visitor_Pattern is
   Car       : constant Cars.Car_Record := Cars.Initialize;
   Performer : aliased Visitors.Perform;
   Printer   : aliased Visitors.Print;
begin
   Car.Accept_Visitor (Performer);
   Car.Accept_Visitor (Printer);
end Visitor_Pattern;
