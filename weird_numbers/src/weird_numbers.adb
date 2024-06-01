pragma Ada_2022;

with Ada.Text_IO;
with Ada.Containers.Vectors;
with Ada.Containers.Ordered_Sets;

procedure Weird_Numbers is
   package IO renames Ada.Text_IO;

   package IntVecs is new Ada.Containers.Vectors
     (Index_Type => Positive, Element_Type => Positive);
   subtype IntVec is IntVecs.Vector;
   use all type IntVec;

   Factor_Cache : IntVec;

   package Intsets is new Ada.Containers.Ordered_Sets
     (Element_Type => Positive);
   subtype Intset is Intsets.Set;
   Semiperfect_Cache  : Intset;
   Not_Abundant_Cache : Intset;

   function Proper_Divisors (Value : Positive) return IntVec is
      Cofactors : IntVec;
   begin
      Factor_Cache.Clear;
      begin
         Factor_Cache.Append (1);
         for Factor in 2 .. Value / 2 loop
            if Factor * Factor > Value then
               exit;
            end if;
            if Value rem Factor = 0 then
               Factor_Cache.Append (Factor);
               if Factor * Factor /= Value then
                  Cofactors.Append (Value / Factor);
               end if;
            end if;
         end loop;
         Factor_Cache.Prepend_Vector (Cofactors);
         return Factor_Cache;
      end;
   end Proper_Divisors;

   function Is_Abundant (Value : Positive) return Boolean is
   begin
      if Not_Abundant_Cache.Contains (Value)
        or else Semiperfect_Cache.Contains (Value)
      then
         return False;
      end if;
      if Proper_Divisors (Value)'Reduce ("+", 0) > Value then
         return True;
      end if;
      Not_Abundant_Cache.Insert (Value);
      return False;
   end Is_Abundant;

   function Subset_Of (Factors : IntVec; Ith : Positive) return IntVec is
      Result        : IntVec;
      Index         : Natural := 1;
      Ith_Remainder : Natural := Ith;
   begin
      while Ith_Remainder /= 0 loop
         if Ith_Remainder rem 2 = 1 then
            Result.Append (Factors (Index));
            Ith_Remainder := @ - 1;
         end if;
         Ith_Remainder := @ / 2;
         Index         := @ + 1;
      end loop;
      return Result;
   end Subset_Of;

   function Alternate_Semiperfect (Value : Positive) return Boolean is
      function Reroute
        (Value : Positive; First : Positive) return Boolean
      is
         Head : Positive;
      begin
         if Factor_Cache.Last_Index >= First then
            Head := Factor_Cache (First);
            if Value < Head then
               return Reroute (Value, First + 1);
            else
               return
                 Value = Head
                 or else Reroute (Value - Head, First + 1)
                 or else Reroute (Value, First + 1);
            end if;
         else
            return False;
         end if;
      end Reroute;
   begin
      return
        Reroute
          (Value, Factor_Cache.First_Index);
   end Alternate_Semiperfect;

   function Is_Semiperfect (Value : Positive) return Boolean is
      Factors : constant IntVec := Factor_Cache;
      Subset  : IntVec;
      Sum     : Natural;
   begin
      if (for some Previous of Semiperfect_Cache => Value rem Previous = 0)
      then
         return True;
      end if;
      for Ith in reverse 1 .. (2**Positive (Factors.Length) - 1) loop
         Subset := Subset_Of (Factors, Positive (Ith));
         Sum := Subset'Reduce ("+", 0);
         if Sum = Value then
            Semiperfect_Cache.Insert (Value);
            return True;
         end if;
      end loop;
      return False;
   end Is_Semiperfect;

   function Is_Weird (Value : Positive) return Boolean is
     (Is_Abundant (Value) and then not Alternate_Semiperfect (Value));

   Current      : Positive := 2;
   Number_Found : Natural  := 0;

begin
   IO.Put ("The first 25 weird numbers are");
   while Number_Found < 25 loop
      if Is_Weird (Current * 2) then
         IO.Put (Integer'Image (Current * 2));
         Number_Found := @ + 1;
      end if;
      Current := @ + 1;
   end loop;
   IO.New_Line;
end Weird_Numbers;
