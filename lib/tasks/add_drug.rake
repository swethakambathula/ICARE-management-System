desc 'Add drug'
task :add_drug  => :environment do
  Drug.find_or_create_by(name: "Drug 1", dose: "dose", stock: 20000)
  Drug.find_or_create_by(name: "Drug 2", dose: "dose", stock: 20000)
  Drug.find_or_create_by(name: "Drug 3", dose: "dose", stock: 20000)
  Drug.find_or_create_by(name: "Drug 4", dose: "dose", stock: 20000)
  Drug.find_or_create_by(name: "Drug 5", dose: "dose", stock: 20000)
end