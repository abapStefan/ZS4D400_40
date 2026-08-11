*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_hotel DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.


   DATA name TYPE string.
   DATA pools TYPE i.
   DATA beds TYPE i.

   CLASS-DATA counter TYPE i.


  PROTECTED SECTION.



  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_hotel IMPLEMENTATION.

ENDCLASS.
