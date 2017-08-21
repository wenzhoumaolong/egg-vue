const Transfer = require('../model/response');
const { INVALID_IDENTITY } = require('../error');

module.exports = app  => {
	return class RfidController extends app.Controller {
		* create() {
			const { service, query } = this.ctx;
			const { identity, status } = query;

			if (!identity) {
				this.ctx.body = new Transfer(INVALID_IDENTITY);
				return;
			}
			var i = identity.toLowerCase();
			console.log('111111111111');
			console.log(i);
			console.log(status);
			const result = yield service.rfid.saveIdentity(i, status);
			if (result.success == true) {
				this.ctx.body = new Transfer();
			} else {
				this.ctx.body = new Transfer(result.error);
			}
			return;
		}

		* get() {
			const { service } = this.ctx;
			const result = yield service.rfid.getNewestRfid();
			if (result.success) {
				this.ctx.body = new Transfer(200, { identity: result.identity });
			} else {
				this.ctx.body = new Transfer(result.error);
			}
			return;
		}
	}
}
