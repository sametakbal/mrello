create table if not exists users(
    id serial primary key,
    name varchar(255) not null,
    surname varchar(255) not null,
    email varchar(320) not null unique,
    password varchar(255) not null
);

create table if not exists board(
    id serial primary key,
    title varchar(255) not null,
    user_id int,
    created_at timestamp default now(),
    CONSTRAINT fk_user_id
        FOREIGN KEY (user_id)
            REFERENCES users (id) on delete cascade
);

create table if not exists list(
    id serial primary key,
    title varchar(255) not null,
    order_number smallint not null,
    board_id int,
    CONSTRAINT fk_board_id
        FOREIGN KEY (board_id)
            REFERENCES board (id) on delete cascade
);

create table if not exists task(
    id serial primary key,
    title varchar(255) not null,
    description varchar(1000) not null,
    due_time timestamp not null,
    created_at timestamp default now(),
    updated_at timestamp,
    list_id int,
    CONSTRAINT fk_list_id
        FOREIGN KEY (list_id)
            REFERENCES list (id) on delete cascade
);