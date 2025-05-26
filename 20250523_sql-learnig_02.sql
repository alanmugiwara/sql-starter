-- > Exercício 2
USE streaming;

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(50),
    event_date DATE
);

CREATE TABLE participants (
    participant_id INT PRIMARY KEY,
    participant_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE registrations (
    registration_id INT PRIMARY KEY,
    participant_id INT,
    event_id INT,
    registration_date DATE,
    FOREIGN KEY (participant_id) REFERENCES participants(participant_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- > Inserção de dados
INSERT INTO events (event_id, event_name, event_date) VALUES
(1, 'Tech Conference', '2023-11-01'),
(2, 'Music Festival', '2023-12-15'),
(3, 'Art Exhibition', '2023-10-20'),
(4, 'Food Fair', '2023-11-10');

INSERT INTO participants (participant_id, participant_name, email) VALUES
(1, 'Emma', 'emma@example.com'),
(2, 'Liam', 'liam@example.com'),
(3, 'Olivia', 'olivia@example.com'),
(4, 'Noah', 'noah@example.com');

INSERT INTO registrations (registration_id, participant_id, event_id, registration_date) VALUES
(1, 1, 1, '2023-10-01'),
(2, 2, 2, '2023-10-05'),
(3, 3, 3, '2023-09-20'),
(4, 4, 4, '2023-10-10'),
(5, 1, 2, '2023-10-15');

-- > Exercício de >INNER JOIN<
SELECT
    registrations.registration_id,
    participants.participant_name,
    events.event_name,
    registrations.registration_date
FROM
    registrations
INNER JOIN
    participants ON registrations.participant_id = participants.participant_id
INNER JOIN
    events ON registrations.event_id = events.event_id;


-- > Exercício de >LEFT JOIN<
SELECT
    participants.participant_name,
    registrations.registration_id,
    events.event_name,
    registrations.registration_date
FROM
    participants
LEFT JOIN
    registrations ON participants.participant_id = registrations.participant_id
LEFT JOIN
    events ON registrations.event_id = events.event_id;

-- > Exercício de >RIGHT JOIN<
SELECT
    events.event_name,
    registrations.registration_id,
    participants.participant_name,
    registrations.registration_date
FROM
    events
RIGHT JOIN
    registrations ON events.event_id = registrations.event_id
RIGHT JOIN
    participants ON registrations.participant_id = participants.participant_id;

-- > Exercício de >FULL ALTER JOIN<
SELECT
    participants.participant_name,
    events.event_name,
    registrations.registration_id,
    registrations.registration_date
FROM
    participants
FULL OUTER JOIN
    registrations ON participants.participant_id = registrations.participant_id
FULL OUTER JOIN


-- > Exercício de >CROSS JOIN<
SELECT
    participants.participant_name,
    events.event_name
FROM
    participants
CROSS JOIN
    events;