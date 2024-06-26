pragma Ada_2022;

with Cars;
with Visitors;

procedure Visitor_Pattern is
   Car       : Cars.Car_Record := Cars.Initialize;
   Performer : aliased Visitors.Perform;
   Printer   : aliased Visitors.Print;
begin
   Car.Visit (Performer);
   Car.Visit (Printer);
end Visitor_Pattern;
