*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

class lcl_demo definition.

  public section.

  methods add_ten
     CHANGING
       cv_number TYPE i.


  protected section.
  private section.

endclass.

class lcl_demo implementation.

  method add_ten.

    cv_number = cv_number + 10.

  endmethod.

endclass.
