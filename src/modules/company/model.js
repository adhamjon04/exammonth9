const { fetch, fetchAll } = require('../../lib/postgres');
const GETCOMPANY = `select * from getcompany()`;
const GETCOMPLEX = `select * from getcomplex($1)`;
const GETROOM = `select * from getroom($1)`;

const getCompany = () => fetchAll(GETCOMPANY);
const getComplex = (id) => fetchAll(GETCOMPLEX, id);
const getRoom = (id) => fetchAll(GETROOM, id);

module.exports = {
    getCompany,
    getComplex,
    getRoom,
};
