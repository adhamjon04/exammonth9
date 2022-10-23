const { fetch, fetchAll } = require('../../lib/postgres');
const GETBANKS = `select * from getbanks($1)`;

const getBanks = (sum) => fetchAll(GETBANKS, sum);

module.exports = {
    getBanks,
};
