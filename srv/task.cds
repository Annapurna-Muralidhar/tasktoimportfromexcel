using {com.task.hackathon as db} from '../db/schema';

service MyService {
    entity Product as projection on db.Product;
    entity Customer as projection on db.Customer;
    
};






annotate MyService.Product with @odata.draft.enabled;












annotate MyService.Product with @(
    UI.LineItem: [
        {
            Label: 'Product ID',
            Value: p_id
        },
        {
            Label: 'Product Name',
            Value: name
        },
        {
            Label: 'Cost Price',
            Value: costPrice
        },
        {
            Label: 'Sell Price',
            Value: sellPrice
        }
    ],
    UI.FieldGroup #product: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                Label: 'Product ID',
                Value: p_id
            },
            {
                Label: 'Product Name',
                Value: name
            },
            {
                Label: 'Cost Price',
                Value: costPrice
            },
            {
                Label: 'Sell Price',
                Value: sellPrice
            }
        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'productFacet',
            Label: 'Product Facets',
            Target: '@UI.FieldGroup#product'
        },
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'relatedCustomerFacet',
            Label: 'Related Customer',
            Target:'Customer/@UI.LineItem',
            
        }
    ]
);

annotate MyService.Customer with @(
    UI.LineItem:[
       
        {
            Label: 'Product ID',
            Value: pid.p_id

        },
         {
            Label: 'Customer Name',
            Value: name
        },
        {
            Label: 'Customer Address',
            Value: add
        },
        
        
      
      
    ],
    UI.FieldGroup #customer : {
        $Type : 'UI.FieldGroupType',
        Data : [
        
        {
            Label: 'Product ID',
            Value: pid.p_id
        },
         {
            Label: 'Customer Name',
            Value: name
        },
        {
            Label: 'Customer Address',
            Value: add
        },
         
       
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ItemsFacet',
            Label : 'Items',
            Target : '@UI.FieldGroup#customer',
        },
    ],
);