*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_hotel DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.

    DATA beds TYPE i.
    DATA pools TYPE i.
    DATA name TYPE string.




   CLASS-DATA n_o_counter TYPE i.

   METHODS set_attributes
           IMPORTING
           i_name TYPE string
           i_pools TYPE i
           i_beds TYPE i.

   METHODS get_attributes
           EXPORTING
           e_name TYPE string
           e_pools TYPE i
           e_beds TYPE i.



  PROTECTED SECTION.



  PRIVATE SECTION.




ENDCLASS.

CLASS lcl_hotel IMPLEMENTATION.

  METHOD set_attributes.

     me->name = i_name.
     me->pools = i_pools.
     me->beds = i_beds.
     n_o_counter = n_o_counter + 1.

  ENDMETHOD.

  METHOD get_attributes.

    e_name = name.
    e_pools = pools.
    e_beds = beds.

  ENDMETHOD.

ENDCLASS.
