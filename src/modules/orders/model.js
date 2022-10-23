const { fetch, fetchAll } = require('../../lib/postgres');
const INSERTORDER = `call insertorder($1,$2,$3,$4,$5,$6,$7,$8,$9)`;
const CHECKORDER = `select * from checker($1,$2,$3,$4,$5)`;

const insertOrder = (
    name,
    phone,
    paymentduration,
    spayment,
    mapyment,
    bankid,
    companyid,
    complexid,
    roomid
) =>
    fetch(
        INSERTORDER,
        name,
        phone,
        paymentduration,
        spayment,
        mapyment,
        bankid,
        companyid,
        complexid,
        roomid
    );

const checkOrder = (companyid, complexid, roomid, bankid, duration) => {
    return fetchAll(CHECKORDER, companyid, complexid, roomid, bankid, duration);
};

module.exports = {
    insertOrder,
    checkOrder,
};
