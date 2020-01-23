CREATE TABLE users (
  user_id NUMBER(50),  
  user_name   VARCHAR2(50) NOT NULL,
  first_name VARCHAR2(50) NOT NULL, 
  last_name VARCHAR2(50),
  Birth_date DATE,
  Gender varchar(1),
  Phone_number NUMBER(15),
  Address VARCHAR2(50),
  Country VARCHAR2(50),
  date_created DATE,
  CONSTRAINT user_id_pk PRIMARY KEY (user_id, user_name)
);

CREATE TABLE users_login (
  login_id NUMBER(50) NOT NULL, 
  user_id NUMBER,
  user_name   VARCHAR2(50) NOT NULL,
  email			VARCHAR2(250),
  password VARCHAR2(50),
  newemail VARCHAR2(50),
  oldemail VARCHAR2(50),
  name VARCHAR2(50) NOT NULL,  
  enabled BOOLEAN,
  last_login TIMESTAMP WITH LOCAL TIME ZONE NOT NULL,
  created_at timestamp without time zone NOT NULL,
  updated_at timestamp without time zone NOT NULL,
  CONSTRAINT fk_users
    FOREIGN KEY (user_id, user_name)
    REFERENCES users(user_id,user_name)
);

CREATE TABLE session (
  id NUMBER PRIMARY KEY,
  user_id NUMBER,
  user_name   VARCHAR2(50) NOT NULL,
  image_url text,
  created_at timestamp without time zone NOT NULL,
  updated_at timestamp without time zone NOT NULL,
  FOREIGN KEY (id, user_id)    -- added
    REFERENCES users_login (login_id, user_id)
);


CREATE TABLE clicks (
  id NUMBER,   
  user_id NUMBER,   
  login_id VARCHAR2(50),        -- was: REFERENCES users_login (login_id),
  clicked_at timestamp without time zone NOT NULL,
  site_url VARCHAR2(50) NOT NULL,
  cost_per_click_usd NUMBER(20,10),
  user_ip VARCHAR2(50) NOT NULL,
  user_data VARCHAR2(50) NOT NULL,
  PRIMARY KEY (user_id, id),      -- added
  FOREIGN KEY (login_id, user_id)    -- added
    REFERENCES users_login (login_id, user_id)
);
