pragma Ada_2022;

with Base;
with Bodies;
with Engines;
with Wheels;

limited with Visitors;

package Cars is

   type Car_Record is new Base.Base_Record with private;

   procedure Visit (Self : Car_Record; Visitor : Visitors.Visitor'Class);

   function Initialize return Car_Record;

private

   type Wheel_Array is array (1 .. 4) of Wheels.Wheel_Record;

   type Car_Record is new Base.Base_Record with record
      Bod : Bodies.Body_Record;
      Eng : Engines.Engine_Record;
      Whs : Wheel_Array;
   end record;

end Cars;
