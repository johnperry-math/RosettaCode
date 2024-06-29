pragma Ada_2022;

with Base;

limited with Visitors;

package Bodies is

   type Body_Record is new Base.Base_Record with private;

   procedure Accept_Visitor
     (Self : Body_Record; Whom : Visitors.Visitor'Class);

   procedure Visit (Self : Body_Record; Visitor : Visitors.Visitor'Class);

private

   type Body_Record is new Base.Base_Record with null record;

end Bodies;
