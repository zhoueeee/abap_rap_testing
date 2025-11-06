@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bokking Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZCZX_BOOKING_M
  as projection on zizx_booking_m
{
  key TravelId,
  key BookingId,
      BookingDate,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.LastName as CustomerName,
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierId,
      _Carrier.Name      as CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      @ObjectModel.text.element: [ 'Text' ]
      //由于有多层路径，需要下面这个申明来指明text的路径了
      @ObjectModel.text.association: '_BookingStatus._Text'
      BookingStatus,
      _BookingStatus._Text.Text : localized,
      LastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingSupplement : redirected to composition child ZCZX_BOOKSUPP_M,
      _Carrier,
      _Connection,
      _Currency,
      _Customer,
      _Travel            : redirected to parent ZCZX_TRAVEL_M
}
