@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travelling Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZCZX_TRAVEL_M
  provider contract transactional_query
  as projection on zizx_travel_m

{
  key TravelId,
      @ObjectModel.text.element:[ 'AgencyName' ]
      AgencyId,
      _Agency.Name       as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      @ObjectModel.text.association: '_Customer'
      CustomerId,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode:'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode:'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      @ObjectModel.text.element:['Text']
      @ObjectModel.text.association: '_Status._Text'
      OverallStatus,
      _Status._Text.Text : localized,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZCZX_BOOKING_M,
      _Currency,
      _Customer,
      _Status
}
