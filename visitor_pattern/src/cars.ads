pragma Ada_2022;

limited with Visitors;

with Base;
with Bodies;
with Engines;
with Wheels;

package Cars is

   type Car_Record is new Base.Base_Record with private;

   procedure Accept_Visitor (Self : Car_Record; Whom : Visitors.Visitor'Class);

   function Initialize return Car_Record;

private

   type Wheel_Enum is (Left_Front, Right_Front, Left_Back, Right_Back);

   type Wheel_Array is array (Wheel_Enum) of Wheels.Wheel_Record;

   type Car_Record is new Base.Base_Record with record
      Bod : Bodies.Body_Record;
      Eng : Engines.Engine_Record;
      Whs : Wheel_Array;
   end record;

end Cars;
