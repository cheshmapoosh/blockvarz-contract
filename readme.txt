truffle console
>

let instance = await MemberCertificate.deployed()

instance.setCertificate('test', accounts[0], '159753', 'hasan')
instance.setCertificateTHash('test', '0xsdsds')

instance.getCertificate('test')

instance.getCertificates();

instance.owner();
