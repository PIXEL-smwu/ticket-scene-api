CREATE TABLE Relationship{
    user_first_id VARCHAR(225),
    user_second_id VARCHAR(225),
    relation VARCHAR(225),
    PRIMARY KEY(user_first_id, user_second_id)
};