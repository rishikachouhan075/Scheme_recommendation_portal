SELECT current_user;
SELECT current_database();

-- /////////////////
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    aadhar_number VARCHAR(12) UNIQUE NOT NULL,
    full_name TEXT NOT NULL,
    dob DATE,
    gender TEXT,
    address TEXT,
    mobile_number VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User 1
INSERT INTO users (aadhar_number, full_name, dob, gender, address, mobile_number)
VALUES ('123456789012', 'Isha Sharma', '2000-05-12', 'Female', 'Pune, Maharashtra', '9876543210');

-- User 2
INSERT INTO users (aadhar_number, full_name, dob, gender, address, mobile_number)
VALUES ('987654321098', 'Amit Verma', '1995-08-25', 'Male', 'Delhi, India', '9123456780');

-- User 3
INSERT INTO users (aadhar_number, full_name, dob, gender, address, mobile_number)
VALUES ('111122223333', 'Priya Nair', '1988-11-03', 'Female', 'Kochi, Kerala', '9988776655');

-- ///////////////

CREATE TABLE schemes (
    scheme_id SERIAL PRIMARY KEY,
    scheme_name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    department VARCHAR(100),           --  e.g., 'Women & Child Development'
    start_date DATE NOT NULL,          
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO schemes (
    scheme_name, description, department, start_date, is_active
)
VALUES (
    'Majhi Ladki Bahin Yojna',
    'Financial support scheme for eligible women in Maharashtra including married, widowed, divorced, and destitute women.',
    'Women & Child Development',
    '2024-07-01',
    TRUE
);

INSERT INTO schemes (
    scheme_name, description, department, start_date, is_active
)
VALUES (
    'Ladka Bhau Yojana',
    'Free training and monthly stipend for unemployed youth and students in Maharashtra to enhance their job readiness.',
    'Skill Development and Entrepreneurship Department',
    '2023-07-17',
    TRUE
);


-- ///////////////////

CREATE TABLE eligibility_criteria (
    criteria_id SERIAL PRIMARY KEY,
    scheme_id INTEGER REFERENCES schemes(scheme_id) ON DELETE CASCADE,
    gender VARCHAR(10),                       
    min_age INTEGER,
    max_age INTEGER,
    income_limit NUMERIC(10, 2),               
    state VARCHAR(100),
    requires_bank_account BOOLEAN,
    aadhaar_link_required BOOLEAN,
    marital_status VARCHAR(30),               
    employment_types TEXT[]                    -- e.g., ARRAY['Unemployed', 'Outsourced']
);


INSERT INTO eligibility_criteria (
    scheme_id,
    gender,
    min_age,
    max_age,
    income_limit,
    state,
    requires_bank_account,
    aadhaar_link_required,
    marital_status,
    employment_types
) VALUES (
    1,
    'Female',
    21,
    65,
    250000.00,
    'Maharashtra',
    TRUE,
    TRUE,
    'Any',  -- covers Married, Widowed, Divorced, etc.
    ARRAY['Outsourced', 'Voluntary', 'Contract']
);

INSERT INTO eligibility_criteria (
    scheme_id,
    gender,
    min_age,
    max_age,
    income_limit,
    state,
    requires_bank_account,
    aadhaar_link_required,
    marital_status,
    employment_types
) VALUES (
    2,
    'Male',  
    18,
    35,
    NULL,  
    'Maharashtra',
    TRUE,
    TRUE,
    'Any',
    ARRAY['Unemployed']
);


SELECT * FROM users;

select * from schemes;

select * from eligibility_criteria;
