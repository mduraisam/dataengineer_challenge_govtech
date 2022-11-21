CREATE TABLE IF NOT EXISTS ecommerce."DIM_CUSTOMER"
(
    id serial NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(30) NOT NULL,
    contact integer NOT NULL,
    membership_id integer NOT NULL,
    address varchar(255) NULL,
    dob varchar(12) NOT NULL,
    CONSTRAINT "customer_pkey" PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS ecommerce."DIM_PRODUCT
(
    id serial NOT NULL,
    name varchar(255) NOT NULL,
    manufacture_name varchar(255) NOT NULL,
    weight decimal(10,2) NOT NULL,
    price decimal(10,2) NOT NULL,
    CONSTRAINT "product_pkey" PRIMARY KEY (id)
);



CREATE TABLE IF NOT EXISTS ecommerce."DIM_SELLER"
(
    id serial NOT NULL,
    name varchar(255) NOT NULL,
    address varchar(255) NULL,
    contact varchar(12) NOT NULL,
    CONSTRAINT "seller_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ecommerce."DIM_DATES"
(
    id serial NOT NULL,
    year integer NOT NULL,
    month integer NULL,
    day integer NOT NULL,
    CONSTRAINT "date_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ecommerce."FACT_SALES_TRANSACTION"
(
    id serial NOT NULL,
    product_id integer NOT NULL,
    customer_id integer NULL,
    date_id integer NOT NULL,
    seller_id integer NOT NULL,
    total_price decimal(10,2) ,
    payment_mode varchar(20) NOT NULL
    CONSTRAINT "sales_pkey" PRIMARY KEY (id),
     CONSTRAINT "customer_fkey" FOREIGN KEY ("customer_id")
        REFERENCES ecommerce."DIM_CUSTOMER" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "product_fkey" FOREIGN KEY ("product_id")
        REFERENCES ecommerce."DIM_PRODUCT" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
    CONSTRAINT "seller_fkey" FOREIGN KEY ("seller_id")
        REFERENCES ecommerce."DIM_SELLER" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
    CONSTRAINT "dateid_fkey" FOREIGN KEY ("date_id")
        REFERENCES ecommerce."DIM_DATES" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);