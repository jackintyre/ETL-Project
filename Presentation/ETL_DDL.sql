-- Database: ETL_DB

-- DROP DATABASE "ETL_DB";

CREATE DATABASE "ETL_DB"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Table: public.Child_Poverty

-- DROP TABLE public."Child_Poverty";

CREATE TABLE public."Child_Poverty"
(
    "ID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 100 MINVALUE 100 MAXVALUE 1000 CACHE 1 ),
    "Date" date NOT NULL,
    "All_Families_Total" bigint NOT NULL,
    "Married_Household" bigint NOT NULL,
    "F-Only" bigint NOT NULL,
    "M-Only" bigint NOT NULL,
    "Race/Ethnicity" "char" NOT NULL,
    CONSTRAINT "Child_Poverty_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "National_Counts_Child_Poverty_FK" FOREIGN KEY ("ID")
        REFERENCES public."National_Counts" ("ID") MATCH FULL
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Child_Poverty"
    OWNER to postgres;

-- Table: public.Math_Scores

-- DROP TABLE public."Math_Scores";

CREATE TABLE public."Math_Scores"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 100 MINVALUE 100 MAXVALUE 1000 CACHE 1 ),
    "Year" date NOT NULL,
    "Grade" "char"[] NOT NULL,
    "All_Students" bigint NOT NULL,
    "NLSP_Eligible" bigint NOT NULL,
    "NLSP_Not_Eligible" bigint NOT NULL,
    "NLSP_Unknown" bigint NOT NULL,
    "EDU_Parent_No_HS" bigint NOT NULL,
    "EDU_Parent_HS_Grad" bigint NOT NULL,
    "EDU_Parent_Some_College" bigint NOT NULL,
    "EDU_Parent_CollGrad" bigint NOT NULL,
    CONSTRAINT "Math_Scores_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "National_Counts_Math_Scores_FK" FOREIGN KEY ("ID")
        REFERENCES public."National_Counts" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Math_Scores"
    OWNER to postgres;

-- Table: public.NLSP_Eligibility_School_Locale

-- DROP TABLE public."NLSP_Eligibility_School_Locale";

CREATE TABLE public."NLSP_Eligibility_School_Locale"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 100 MINVALUE 100 MAXVALUE 1000 CACHE 1 ),
    "Year" date NOT NULL,
    "School_Locale" "char"[] NOT NULL,
    "School_Locale_Student_Count" bigint NOT NULL,
    "Student_R_E" "char"[] NOT NULL,
    "Student_R_E_Count" bigint NOT NULL,
    CONSTRAINT "NLSP_Eligibility_School_Locale_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "National_Counts_NLSP_School_Locale_FK" FOREIGN KEY ("ID")
        REFERENCES public."National_Counts" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."NLSP_Eligibility_School_Locale"
    OWNER to postgres;

-- Table: public.NLSP_Eligibility_School_National

-- DROP TABLE public."NLSP_Eligibility_School_National";

CREATE TABLE public."NLSP_Eligibility_School_National"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 100 MINVALUE 100 MAXVALUE 1000 CACHE 1 ),
    "Year" date NOT NULL,
    "School_Level" "char"[] NOT NULL,
    "School_Level_Student_Count" bigint NOT NULL,
    "Student_RE" character(1)[] COLLATE pg_catalog."default" NOT NULL,
    "Student_RE_Count" bigint NOT NULL,
    CONSTRAINT "NLSP_Eligibility_School_National_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "National_Counts_NLSP_National_FK" FOREIGN KEY ("ID")
        REFERENCES public."National_Counts" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."NLSP_Eligibility_School_National"
    OWNER to postgres;

-- Table: public.National_Counts

-- DROP TABLE public."National_Counts";

CREATE TABLE public."National_Counts"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 100 MINVALUE 100 MAXVALUE 1000 CACHE 1 ),
    "Year" date NOT NULL,
    CONSTRAINT "National_Counts_pkey" PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE public."National_Counts"
    OWNER to postgres;
CREATE TABLE public."Reading_Scores"
(
    "Year" date NOT NULL,
    "All Students" bigint NOT NULL,
    "NLSP_Eligible" bigint NOT NULL,
    "NLSP_Not_Eligible" bigint NOT NULL,
    "NLSP-Unknown" bigint NOT NULL,
    "EDU-Parent-No HS" bigint NOT NULL,
    "EDU-Parent-HSGrad" bigint NOT NULL,
    "EDU-Parent-Some-College" bigint NOT NULL,
    "EDU-Parent-CollGrad" bigint[] NOT NULL,
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 100 MINVALUE 100 MAXVALUE 1000 CACHE 1 ),
    CONSTRAINT "Reading_Scores_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "National_Counts_Reading_Scores_FK" FOREIGN KEY ("ID")
        REFERENCES public."National_Counts" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Reading_Scores"
    OWNER to postgres;

-- Table: public.S_NCES_Enrollment

-- DROP TABLE public."S_NCES_Enrollment";

CREATE TABLE public."S_NCES_Enrollment"
(
    "ID" bigint NOT NULL,
    "Year" date NOT NULL,
    "State" "char"[] NOT NULL,
    "Students_Enrolled" bigint NOT NULL,
    "Students_Eligible_FR_Lunch" bigint NOT NULL,
    CONSTRAINT "S_NCES_Enrollment_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "States_NCES_Enrollment" FOREIGN KEY ("ID")
        REFERENCES public."States" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."S_NCES_Enrollment"
    OWNER to postgres;

-- Table: public.S_NLSP_Lunches_Served

-- DROP TABLE public."S_NLSP_Lunches_Served";

CREATE TABLE public."S_NLSP_Lunches_Served"
(
    "ID" bigint NOT NULL,
    "Year" date NOT NULL,
    "State" "char"[] NOT NULL,
    "Lunches_Served_Count" bigint NOT NULL,
    CONSTRAINT "S_NLSP_Lunches_Served_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "States_Lunches_FK" FOREIGN KEY ("ID")
        REFERENCES public."States" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."S_NLSP_Lunches_Served"
    OWNER to postgres;

-- Table: public.S_NLSP_Participation

-- DROP TABLE public."S_NLSP_Participation";

CREATE TABLE public."S_NLSP_Participation"
(
    "ID" bigint NOT NULL,
    "Year" date NOT NULL,
    "State" "char"[] NOT NULL,
    "Student_Enrollment" bigint NOT NULL,
    CONSTRAINT "S_NLSP_Participation_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "States_Participation_FK" FOREIGN KEY ("ID")
        REFERENCES public."States" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."S_NLSP_Participation"
    OWNER to postgres;

-- Table: public.S_NLSP_Payments

-- DROP TABLE public."S_NLSP_Payments";

CREATE TABLE public."S_NLSP_Payments"
(
    "ID" bigint NOT NULL,
    "State" "char"[] NOT NULL,
    "AnnAmount" double precision NOT NULL,
    CONSTRAINT "S_NLSP_Payments_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "States_Payments_FK" FOREIGN KEY ("ID")
        REFERENCES public."States" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."S_NLSP_Payments"
    OWNER to postgres;

-- Table: public.State_Certification

-- DROP TABLE public."State_Certification";

CREATE TABLE public."State_Certification"
(
    "ID" bigint NOT NULL,
    "Year_Certified" date NOT NULL,
    "State" "char"[] NOT NULL,
    "SNAP_Participants" bigint NOT NULL,
    "NLSP_Direct_Certifications" bigint NOT NULL,
    CONSTRAINT "State_Certification_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "States_State_Certification_FK" FOREIGN KEY ("ID")
        REFERENCES public."States" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."State_Certification"
    OWNER to postgres;

-- Table: public.States

-- DROP TABLE public."States";

CREATE TABLE public."States"
(
    "ID" bigint NOT NULL,
    "State" "char"[] NOT NULL,
    CONSTRAINT "States_pkey" PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE public."States"
    OWNER to postgres;