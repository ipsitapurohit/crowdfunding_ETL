---------------------------------------- Create table queries -----------------------------------------
-- Table: crowdfunding_db_schema.category

-- DROP TABLE IF EXISTS crowdfunding_db_schema.category;

CREATE TABLE IF NOT EXISTS crowdfunding_db_schema.category
(
    category_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    category character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT category_pkey PRIMARY KEY (category_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS crowdfunding_db_schema.category
    OWNER to postgres;

---------------------------------------------------------------------------------------------------------

-- Table: crowdfunding_db_schema.contacts

-- DROP TABLE IF EXISTS crowdfunding_db_schema.contacts;

CREATE TABLE IF NOT EXISTS crowdfunding_db_schema.contacts
(
    contact_id integer NOT NULL,
    first_name character varying(255) COLLATE pg_catalog."default",
    last_name character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT contacts_pkey PRIMARY KEY (contact_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS crowdfunding_db_schema.contacts
    OWNER to postgres;


-----------------------------------------------------------------------------------------------------

-- Table: crowdfunding_db_schema.subcategory

-- DROP TABLE IF EXISTS crowdfunding_db_schema.subcategory;

CREATE TABLE IF NOT EXISTS crowdfunding_db_schema.subcategory
(
    subcategory_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    subcategory character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT subcategory_pkey PRIMARY KEY (subcategory_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS crowdfunding_db_schema.subcategory
    OWNER to postgres;

-----------------------------------------------------------------------------------------------------

-- Table: crowdfunding_db_schema.campaign

-- DROP TABLE IF EXISTS crowdfunding_db_schema.campaign;

CREATE TABLE IF NOT EXISTS crowdfunding_db_schema.campaign
(
    cf_id integer NOT NULL,
    contact_id integer NOT NULL,
    company_name character varying(255) COLLATE pg_catalog."default",
    description character varying(255) COLLATE pg_catalog."default",
    goal bigint,
    pledged bigint,
    outcome character varying(255) COLLATE pg_catalog."default",
    backers_count bigint,
    country character varying(10) COLLATE pg_catalog."default",
    currency character varying(10) COLLATE pg_catalog."default",
    launched_date character varying(20) COLLATE pg_catalog."default",
    end_date character varying(20) COLLATE pg_catalog."default",
    category_id character varying(10) COLLATE pg_catalog."default",
    subcategory_id character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT campaign_pkey PRIMARY KEY (cf_id),
    CONSTRAINT category_id_fk FOREIGN KEY (category_id)
        REFERENCES crowdfunding_db_schema.category (category_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT contact_id_fk FOREIGN KEY (contact_id)
        REFERENCES crowdfunding_db_schema.contacts (contact_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT subcategory_id_fkk FOREIGN KEY (subcategory_id)
        REFERENCES crowdfunding_db_schema.subcategory (subcategory_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS crowdfunding_db_schema.campaign
    OWNER to postgres;
-- Index: fki_category_id_fk

-- DROP INDEX IF EXISTS crowdfunding_db_schema.fki_category_id_fk;

CREATE INDEX IF NOT EXISTS fki_category_id_fk
    ON crowdfunding_db_schema.campaign USING btree
    (launched_date COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;


