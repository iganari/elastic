# ansibleのplaybook内のrolesを共通化で抜き出し。

roles以外や、varの中の一般的でないものは要検討。

運用でカバー？

↑共通化以外のものはshellでカバーとか


```
$ tree -L 2
.
├── dbservers.yml
├── hosts
├── package-ansible-playbook-roles
│   ├── common
│   ├── iptables
│   ├── java
│   ├── jenkins
│   ├── mysql
│   ├── nginx
│   ├── readme.md
│   └── vagrant
├── roles -> package-ansible-playbook-roles
├── site.yml
├── staging
├── vagrant
├── webservers.yml
└── wercker

9 directories, 8 files
```
