const connection = {
    connectionString: 'postgres://postgres:adham@localhost:5432/exammonth9',
    connectionElephantString:
        'postgres://lnhgfouk:WzA-pTyK8UTW_RLOR0oveeMSpnSCOyNo@peanut.db.elephantsql.com/lnhgfouk',
};

const PORT = process.env.PORT || 9000;

module.exports = {
    connection, 
    PORT,
};
