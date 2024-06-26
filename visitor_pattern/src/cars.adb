pragma Ada_2022;

with Ada.Strings.Unbounded;

with Visitors;

package body Cars is

   subtype Unbounded_String is Ada.Strings.Unbounded.Unbounded_String;
   use all type Unbounded_String;

   procedure Visit (Self : Car_Record; Visitor : Visitors.Visitor'Class) is
   begin
      Visitor.Visit_Car (Self);
      Visitor.Visit_Body (Self.Bod);
      Visitor.Visit_Engine (Self.Eng);
      for Wheel of Self.Whs loop
         Visitor.Visit_Wheel (Wheel);
      end loop;
   end Visit;

   function Initialize return Car_Record is
      Result : Car_Record;
   begin
      Result.Whs :=
        [Wheels.Initialize (To_Unbounded_String ("front left")),
        Wheels.Initialize (To_Unbounded_String ("front right")),
        Wheels.Initialize (To_Unbounded_String ("back left")),
        Wheels.Initialize (To_Unbounded_String ("back right"))];
      return Result;
   end Initialize;

end Cars;
