CLASS zx_copy_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zx_copy_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    INSERT ztzx_travel_m FROM ( SELECT * FROM /dmo/travel_m ).

    INSERT ztzx_booking_m FROM ( SELECT * FROM /dmo/booking_m ).

    INSERT ztzx_booksupp_m FROM ( SELECT * FROM /dmo/booksuppl_m ).
    COMMIT WORK.

    out->write( 'OK' ).
  ENDMETHOD.
ENDCLASS.
