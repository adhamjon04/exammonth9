const { fetch, fetchAll } = require('../../lib/postgres');

//ORDER QUERYS
const DELETEORDER = `call deleteorder($1)`;
const GETORDERS = `select * from getorders()`;

//COMPANY QUERYS
const INSERTCOMPANY = `call insertcompany($1)`;
const DELETECOMPANY = `call deletecompany($1)`;
const UPDATECOMPANY = `call updatecompany($1,$2)`;

//COMPLEX QUERYS
const GETCOMPLEXES = `select * from complexes`;
const INSERTCOMPLEX = `call insertcomplex($1,$2)`;
const DELETECOMPLEX = `call deletecomplex($1)`;
const UPDATECOMPLEX = `call updatecomplex($1,$2)`;

//ROOM QUERYS
const INSERTROOM = `call insertroom($1,$2,$3,$4)`;
const GETALLROOMS = `select * from getallroom()`;
const DELETEROOM = `call deleteroom($1)`;
const UPDATEROOM = `call updateroom($1,$2,$3,$4)`;

//BANK QUERYS
const INSERTBANK = `call insertbank($1,$2,$3)`;
const GETBANKS = `select * from banks`;
const DELETEBANK = `call deletebank($1)`;
const UPDATEBANK = `call updatebank($1,$2,$3,$4)`;

//COMPANY FUNCTIONS
const insertCompany = (name) => fetch(INSERTCOMPANY, name);
const deleteCompany = (id) => fetch(DELETECOMPANY, id);
const updateCompany = (id, name) => fetch(UPDATECOMPANY, id, name);

//COMPLEX FUNCTIONS
const getComplexes = () => fetchAll(GETCOMPLEXES);
const insertComplex = (name, id) => fetch(INSERTCOMPLEX, name, id);
const deleteComplex = (id) => fetch(DELETECOMPLEX, id);
const updateComplex = (id, name) => fetch(UPDATECOMPLEX, id, name);

//ROOMFUNCTIONS
const insertRoom = (count, square, price, id) =>
    fetch(INSERTROOM, count, square, price, id);
const getAllRooms = () => fetchAll(GETALLROOMS);
const deleteRoom = (id) => fetch(DELETEROOM, id);
const updateRoom = (id, count, square, price) =>
    fetch(UPDATEROOM, id, count, square, price);

//BANKFUNCTIONS
const getBanks = () => fetchAll(GETBANKS);
const insertBank = (name, maxsum, servise) =>
    fetch(INSERTBANK, name, maxsum, servise);
const deleteBank = (id) => fetch(DELETEBANK, id);
const updateBank = (id, name, sum, service) =>
    fetch(UPDATEBANK, id, name, sum, service);

//ORDERFUNCTION
const getOrders = () => fetchAll(GETORDERS);
const deleteOrder = (id) => fetch(DELETEORDER, id);

module.exports = {
    getOrders,
    deleteOrder,
    insertCompany,
    deleteCompany,
    updateCompany,
    getComplexes,
    insertComplex,
    deleteComplex,
    updateComplex,
    insertRoom,
    getAllRooms,
    updateRoom,
    deleteRoom,
    insertBank,
    getBanks,
    deleteBank,
    updateBank,
};
