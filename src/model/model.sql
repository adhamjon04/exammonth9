create database exammonth9;

drop table if exists company;
create table company(
    company_id uuid default uuid_generate_v4(),
    company_name text not null,
    primary key (company_id)
);

drop table if exists complex;
create table complex(
    complex_id uuid default uuid_generate_v4() primary key,
    complex_name text not null,
    company_id uuid,
    foreign key(company_id)
    references company(company_id)
    on delete cascade
);
drop table if exists room;
create table room(
    room_id uuid default uuid_generate_v4() primary key,
    room_square decimal(10,2) not null,
    room_count int not null,
    room_price int not null,
    complex_id uuid,
    foreign key(complex_id)
    references complex(complex_id)
    on delete cascade
);

create table banks(
    bank_id uuid default uuid_generate_v4() primary key,
    bank_name text not null,
    bank_max_sum bigint not null,
    bank_services int not null
);

create table orders(
    order_id uuid default uuid_generate_v4() primary key,
    orderer_name text not null,
    orderer_phone text not null,
    p_duration int not null,
    s_payment int not null,
    m_payment int not null,
    bank_id uuid,
    company_id uuid,
    complex_id uuid,
    room_id uuid,
    foreign key(bank_id)
    references banks(bank_id)
    on delete cascade,
    foreign key(company_id)
    references company(company_id)
    on delete cascade,
    foreign key(complex_id)
    references complex(complex_id)
    on delete cascade,
    foreign key(room_id)
    references room(room_id)
    on delete cascade
);


--------------------------------- PROCEDURE AND FUNCTIONS FOR COMPANY TABLE --------------------
-- FUNCTION GETCOMPANY
create or replace function getcompany()
returns table(
    Id uuid,
    name text
)
language plpgsql
as $$
begin
    return query
        select
            *
        from
         company;
end; $$;

-- PROCEDURE INSERTCOMPANY
create or replace procedure insertcompany(
    name text
)
language plpgsql
as $$
begin
    insert into company(company_name)
    values(name);
    raise info 'company added';
end; $$;

-- PROCEDURE DELETECOMPANY
create or replace procedure deletecompany(
    id uuid
)
language plpgsql
as $$
begin
    delete from company
    where company_id = id;
    raise info 'company deleted';
end; $$;

-- PROCEDURE UPDATECOMPANY
create or replace procedure updatecompany(
    id uuid,
    name text
)
language plpgsql
as $$
begin
    update company
    set company_name = name
    where company_id = id;
    raise info 'company updated';
end; $$;


--------------------------------- PROCEDURE AND FUNCTIONS FOR COMPLEX TABLE ------------------
-- FUNCTION GETCOMPLEX
create or replace function getcomplex(id uuid)
returns table(
    complexid uuid,
    name text
)
language plpgsql
as $$
begin
    return query
        select
            complex_id,
            complex_name
        from
            complex
         where
            company_id = id;
end; $$;

-- PROCEDURE INSERTCOMPLEX
create or replace procedure insertcomplex(
    name text,
    id uuid
)
language plpgsql
as $$
begin
    insert into complex(complex_name, company_id)
    values(name,id);
    raise info 'complex added';
end; $$;

-- PROCEDURE DELETECOMPLEX
create or replace procedure deletecomplex(
    id uuid
)
language plpgsql
as $$
begin
    delete from complex
    where complex_id = id;
    raise info 'complex deleted';
end; $$;

-- PROCEDURE UPDATECOMPLEX
create or replace procedure updatecomplex(
    id uuid,
    name text
)
language plpgsql
as $$
begin
    update complex
    set complex_name = name
    where complex_id = id;
    raise info 'company updated';
end; $$;

---------------------------------- PROCEDURE AND FUNCTIONS FOR ROOM TABLE ---------------------
-- FUNCTION GETROOM
create or replace function getroom(id uuid)
returns table(
    count int,
    square decimal(10,2),
    price int,
    roomid uuid
)
language plpgsql
as $$
begin
    return query
        select
            room_count,
            room_square,
            room_price,
            room_id
        from
            room
         where
            complex_id = id;
end; $$;

-- PROCEDURE INSERTROOM
create or replace procedure insertroom(
    count int,
    square text,
    price int,
    id uuid
)
language plpgsql
as $$
declare nsquare decimal(10,2) = replace(square, ',', '.');
begin
    insert into room(room_count,room_square,room_price,complex_id)
    values (count, nsquare, price, id);
    raise info 'room added';
end; $$;

-- FUNCTION GETALLROOMS
create or replace function getallroom()
returns table(
    id uuid,
    room int,
    square decimal(10,2),
    price int,
    complex text
)
language plpgsql
as $$
begin
    return query
        select
            r.room_id,
            r.room_count,
            r.room_square,
            r.room_price,
            c.complex_name
        from
            room r
        left join
            complex c
        on
            r.complex_id = c.complex_id
        order by
            r.room_count, r.room_square;
end; $$;

-- PROCEDURE DELETEROOM
create or replace procedure deleteroom(
    id uuid
)
language plpgsql
as $$
begin
    delete from room
    where room_id = id;
    raise info 'complex deleted';
end; $$;

-- PROCEDURE UPDATEROOM
create or replace procedure updateroom(
    id uuid,
    count int,
    square text,
    price int
)
language plpgsql
as $$
declare nsquare decimal(10,2) = replace(square, ',', '.')::decimal(10,2);
begin
    update room
    set
        room_count = count,
        room_square = nsquare,
        room_price = price
    where room_id = id;
    raise info 'company updated';
end; $$;


---------------------------------- PROCEDURE AND FUNCTIONS FOR BANKS TABLE -----------------
-- FUNCTION GETBANKS
create or replace function getbanks(sum bigint)
returns table(
    bankid uuid,
    bank text,
    max_sum bigint,
    services int
)
language plpgsql
as $$
begin
    return query
        select
            bank_id,
            bank_name,
            bank_max_sum,
            bank_services
        from
            banks
        group by bank_id, bank_name, bank_services
        having bank_max_sum>sum;
end; $$;

-- PROCEDURE INSERTBANKS
create or replace procedure insertbank(
    name text,
    maxsum bigint,
    service int
)
language plpgsql
as $$
begin
    insert into banks(bank_name, bank_max_sum, bank_services)
    values (name, maxsum,service);
    raise info 'bank added';
end; $$;

-- PROCEDURE DELETEBANK
create or replace procedure deletebank(
    id uuid
)
language plpgsql
as $$
begin
    delete from banks
    where bank_id = id;
    raise info 'bank deleted';
end; $$;

-- PROCEDURE UPDATEBANK
create or replace procedure updatebank(
    id uuid,
    name text,
    sum bigint,
    service int
)
language plpgsql
as $$
begin
    update banks
    set
        bank_name = name,
        bank_max_sum = sum,
        bank_services = service
    where bank_id = id;
    raise info 'bank updated';
end; $$;

------------------------------------ PROCEDURE AND FUNCTIONS FOR ORDERS TABLE ----------------
-- PROCEDURE INSERTORDER
create or replace procedure insertorder(
    name text,
    phone text,
    pduration text,
    spayment int,
    mpayment int,
    bankid uuid, 
    companyid uuid,
    complexid uuid, 
    roomid uuid
)
language plpgsql
as $$
begin
    insert into orders(
        orderer_name, 
        orderer_phone, 
        p_duration,
        s_payment,
        m_payment,
        bank_id, 
        company_id,
        complex_id,
        room_id
    )
    values (
        name,
        phone,
        pduration::int,
        spayment,
        mpayment,
        bankid, 
        companyid,
        complexid,
        roomid
    );
    raise info 'order added';
end; $$;

-- FUNCTION GETORDERS
create or replace function getorders()
returns table(
    id uuid,
    name text,
    phone text,
    bank text,
    company text,
    complex text,
    room int,
    square decimal(10,2),
    price bigint,
    service int,
    startingpayment int,
    monthlypayment int,
    duration int
)
language plpgsql
as $$
begin
    return query
        select
            o.order_id,
            o.orderer_name,
            o.orderer_phone,
            b.bank_name,
            cy.company_name,
            cx.complex_name,
            r.room_count,
            r.room_square,
            (r.room_price*r.room_square)::bigint,
            b.bank_services,
            o.s_payment,
            o.m_payment,
            o.p_duration
        from
            orders o
        left join
            company cy
        on
            o.company_id = cy.company_id
        left join
            banks b
        on
            o.bank_id = b.bank_id
        left join
            complex cx
        on
            o.complex_id = cx.complex_id
        left join
            room r
        on 
            o.room_id = r.room_id;
            
end; $$;

-- FUNCTION CHECKORDER
create or replace function checker(
    companyid uuid,
    complexid uuid,
    roomid uuid,
    bankid uuid,
    pduration text
)
returns table(
    company text,
    complex text,
    room int,
    square decimal(10,2),
    price int,
    bank text,
    service int,
    maxsum bigint,
    allprice bigint,
    spayment int,
    mpayment int
)
language plpgsql
as $$
begin
    return query
        select
            cy.company_name,
            cx.complex_name,
            r.room_count,
            r.room_square,
            r.room_price,
            b.bank_name,
            b.bank_services,
            b.bank_max_sum,
            (r.room_square*r.room_price)::bigint,
            (r.room_square*r.room_price*b.bank_services/100)::int,
            ((r.room_square*r.room_price - r.room_square*r.room_price*b.bank_services/100)/(pduration)::int/12)::int
        from company cy
        inner join
            complex cx
        on
            cy.company_id = companyid and cx.complex_id = complexid
        inner join
            room r
        on
            r.room_id = roomid
        inner join
            banks b
        on
            b.bank_id = bankid;
end; $$;

-- PROCEDURE DELETEORDER
create or replace procedure deleteorder(
    id uuid
)
language plpgsql
as $$
begin
    delete from orders
    where order_id = id;
    raise info 'bank deleted';
end; $$;


---------------------------------------------- VIEWS -------------------------------
create view complexes as select
    cx.complex_id as id,
    cx.complex_name as complex,
    cy.company_name as company
from
    complex cx
left join
    company cy
on
    cx.company_id = cy.company_id;


create view rooms as select
    r.room_id as id,
    r.room_count as room,
    r.room_price as price,
    r.complex_id as complex
from
    room r
left join
    complex c
on
    r.complex_id = c.complex_id;


