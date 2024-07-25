namespace com.task.hackathon;

using {cuid} from '@sap/cds/common';

entity Product : cuid {
  key ID        : UUID;
      p_id      : String(20);

      @title: 'Name'
      name      : String(100);

      

      @title: 'Cost Price'
      costPrice : Decimal(15, 2);

      @title: 'Selling Price'
      sellPrice : Decimal(15, 2);


   Customer : Composition of many Customer on Customer.pid=$self;


}

entity Customer : cuid {
                key ID    : UUID;

                    @title: 'Product ID'
                    pid   : Association to one Product;

                    name          : String(100);

                    add:String(1000);
                    
              }


