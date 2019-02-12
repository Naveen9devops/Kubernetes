To assign extended resources to a Container.

To request an extended resource, include the resources:requests field in your Container manifest. Extended resources are fully qualified with any domain outside of *.kubernetes.io/. Valid extended resource names have the form example.com/foo where example.com is replaced with your organization’s domain and foo is a descriptive resource namei.
