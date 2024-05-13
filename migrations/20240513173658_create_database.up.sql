CREATE TABLE users (
    id                  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email               TEXT NOT NULL UNIQUE,
    hashed_password     TEXT NOT NULL,
    created_at          TIMESTAMP WITH TIME ZONE NOT NULL,
    is_active           BOOLEAN NOT NULL
);

CREATE TABLE projects (
    id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id         INT REFERENCES users(id) NOT NULL,
    title           TEXT NOT NULL,
    description     TEXT,
    created_at      TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE lists (
    id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    project_id      INT REFERENCES projects(id),
    created_at      TIMESTAMP WITH TIME ZONE NOT NULL,
    progress        FLOAT NOT NULL
);

CREATE TABLE tasks (
    id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    list_id         INT REFERENCES lists(id) NOT NULL,
    title           TEXT NOT NULL,
    description     TEXT,
    created_at      TIMESTAMP WITH TIME ZONE NOT NULL,
    is_done         BOOLEAN NOT NULL
);
