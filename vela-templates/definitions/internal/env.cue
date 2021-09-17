env: {
	type: "trait"
	annotations: {}
	labels: {}
	description: "add env on K8s pod for your workload which follows the pod spec in path 'spec.template.'"
	attributes: appliesToWorkloads: ["*"]
}
template: {
	patch: spec: template: spec: {
		// +patchKey=name
		containers: [{
			name: context.name
			// +patchKey=name
			env: [
				for k, v in parameter.env {
					name:  k
					value: v
				},
			]
		}]
	}
	parameter: env: [string]: string
}
