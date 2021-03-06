const Transfer = require('../model/response');

module.exports = app => {
	return class StructureController extends app.Controller {
		* addGrade() {
			const { service, request } = this.ctx;
			const { gradeName } = request.body;
			yield service.structure.addGrade(gradeName);
			this.ctx.body = new Transfer();
			return;
		}

		* delGrade() {
			const { service, request } = this.ctx;
			const { id } = request.body;
			const result = yield service.structure.delGrade(id);
			if (result.success) {
				this.ctx.body = new Transfer();
			} else {
				this.ctx.body = new Transfer(result.error);
			}
			return;
		}

		* addClass() {
			const { service, request } = this.ctx;
			const { gradeId, className } = request.body;
			yield service.structure.addClass(gradeId, className);
			this.ctx.body = new Transfer();
			return;
		}

		* delClass() {
			const { service, request } = this.ctx;
			const { id } = request.body;
			const result = yield service.structure.delClass(id);
			if (result.success) {
				this.ctx.body = new Transfer();
			} else {
				this.ctx.body = new Transfer(result.error);
			}
			return;
		}
	}
}