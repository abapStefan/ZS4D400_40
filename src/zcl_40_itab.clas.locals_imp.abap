*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION.

PUBLIC SECTION.


    CLASS-DATA conn_counter TYPE i READ-ONLY.

    CLASS-METHODS class_constructor.


    METHODS get_output RETURNING VALUE(r_output) TYPE string_table.

    METHODS constructor
      IMPORTING
        i_connection_id TYPE /dmo/connection_id
        i_carrier_id TYPE /dmo/carrier_id
        RAISING
        cx_abap_invalid_value.


    METHODS get_attributes
      EXPORTING
        e_carrier_id    TYPE /dmo/carrier_id
        e_connection_id TYPE /dmo/connection_id.


  PROTECTED SECTION.
  PRIVATE SECTION.

    TYPES: BEGIN OF st_details,
             DepartureAirport TYPE /dmo/airport_from_id,
             DestinationAirport   TYPE /dmo/airport_to_id,
             AirlineName    TYPE /dmo/carrier_name,
           END OF st_details.

     TYPES: BEGIN OF st_airport,
            Airport_ID TYPE /dmo/airport_id,
            Name      TYPE /dmo/airport_name,
            END OF st_airport.

     TYPES tt_airports TYPE STANDARD TABLE OF st_airport
                       WITH NON-UNIQUE DEFAULT KEY.

    DATA details TYPE st_details.

    DATA connection_id TYPE /DMO/connection_id.
    DATA carrier_id TYPE /DMO/carrier_id.

    CLASS-DATA airports TYPE tt_airports.


ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.

    SELECT FROM /dmo/i_airport
       FIELDS AirportID, Name
       INTO TABLE @airports.

  ENDMETHOD.

  METHOD constructor.

    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.


    SELECT SINGLE FROM /dmo/I_Connection
    FIELDS DepartureAirport, DestinationAirport, \_Airline-Name AS AirlineName
    WHERE AirlineID = @i_carrier_id
    AND  ConnectionID = @i_connection_id
    INTO CORRESPONDING FIELDS OF @details.

   IF sy-subrc <> 0.
   RAISE EXCEPTION TYPE cx_abap_invalid_value.
   ENDIF.

    connection_id = i_connection_id.
    carrier_id = i_carrier_id.

    conn_counter = conn_counter + 1.

  ENDMETHOD.

  METHOD get_attributes.

    e_carrier_id = carrier_id.
    e_connection_id = connection_id.

  ENDMETHOD.

  METHOD get_output.

    DATA(departure) = airports[ airport_id = details-departureairport ].

    DATA(destination) = airports[ airport_id = details-destinationairport ].

    APPEND |---------------------------------------------------------------------------| TO r_output.
    APPEND | Carrier:     { carrier_id  } { details-airlinename }                      | TO r_output.
    APPEND | Connection   { connection_ID }                                            | TO r_output.
*    APPEND | Departure:   { details-departureairport }               | TO r_output.
*    APPEND | Destination  { details-destinationairport }             | TO r_output.
    APPEND | Departure:   { details-departureairport } { departure-name }               | TO r_output.
    APPEND | Destination  { details-destinationairport } { destination-name }           | TO r_output.

*   Optional: Verkettete Ausdrücke ohne Hilfsvariable Start und Ziel
*
*    APPENd | Departure: { details-departureairport } { airports[ airport_id = details-departureairport  ]-name } | TO r_output.
*    APPENd | Destination: { details-destinationairport } { airports[ airport_id = details-destinationairport  ]-name } | TO r_output.
  ENDMETHOD.


ENDCLASS.
