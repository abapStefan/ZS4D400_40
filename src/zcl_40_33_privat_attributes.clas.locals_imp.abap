*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_hotel DEFINITION.

  PUBLIC SECTION.

*    DATA beds TYPE i READ-ONLY.
*    DATA pools TYPE i READ-ONLY.
*    DATA name TYPE string READ-ONLY.

   CLASS-DATA n_o_hotels TYPE i.

   METHODS set_attributes
           IMPORTING
           i_name TYPE string OPTIONAL
           i_pools TYPE i
           i_beds TYPE i
           RAISING
           cx_abap_invalid_value.

   METHODS get_attributes
           EXPORTING
           e_name TYPE string
           e_pools TYPE i
           e_beds TYPE i.


   CLASS-METHODS get_n_o_hotels RETURNING VALUE(r_count) TYPE string_table.



  PROTECTED SECTION.



  PRIVATE SECTION.

        DATA beds TYPE i.
        DATA pools TYPE i.
        DATA name TYPE string.


ENDCLASS.

CLASS lcl_hotel IMPLEMENTATION.

  METHOD set_attributes.

    IF i_name IS INITIAL OR I_BEDS IS INITIAL.
     RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

     me->name = i_name.
     me->pools = i_pools.
     me->beds = i_beds.
     n_o_hotels = n_o_hotels + 1.

  ENDMETHOD.

  METHOD get_attributes.

    e_name = name.
    e_pools = pools.
    e_beds = beds.

  ENDMETHOD.

  METHOD get_n_o_hotels.

    APPEND |-------------------------------------------------------------------| to r_count.
    APPEND | Gesamtanzahl der Hotels: { n_o_hotels }                           | to r_count.

  ENDMETHOD.

ENDCLASS.
