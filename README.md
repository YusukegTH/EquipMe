Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.



# 1/ Commit your branch
(my-feature) git add .
(my-feature) git commit -m 'XXXX'
(my-feature) git status # MAKE SURE STATUS IS CLEAN
(my-feature) git push origin 'branch-name'

# 2/ Check out master and pull the latest version
(my-feature) git checkout master
(master)     git pull origin master
(master)     git sweep
# 2.1/ In case of added gems, JS packs or changes to DB schema
(master)     bundle install
(master)     rails db:migrate

# 3/ Check out your branch again and merge
(master)     git checkout my-feature
(my-feature) git merge master
