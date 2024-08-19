@AbapCatalog.sqlViewName: 'ZDEMO_SOI1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'List reporting for sales order items'
define view ZDEMO_DDL_SALES_ORDER_ITEM as select from SEPM_I_SalesOrderItem_E as Item
{
    
    key Item.SalesOrder as SalesOrderID,
    key Item.SalesOrderItem as ItemPosition,
    
    Item._SalesOrder._Customer.CompanyName as Companyname,
    Item.Product as Product,
    @Semantics.currencyCode: true
    Item.TransactionCurrency as CurrencyCode,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Item.GrossAmountInTransacCurrency as GrossAmount,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Item.NetAmountInTransactionCurrency as NetAmount,
    @Semantics.amount.currencyCode: 'CurrencyCode'    
    Item.TaxAmountInTransactionCurrency as TaxAmount,
    Item.ProductAvailabilityStatus   as ProductAvailabilityStatus
}
