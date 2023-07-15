package 'httpd' do
	action :install
end
ruby_block 'randomly_choose_language' do
	block do
		if Random.rand > 0.5
			node.run_state['scripting_language']= 'php'
		else
			node.run_state['scripting_language']='perl'
		end
	end
end
package 'scripting_language' do
	package_name lazy {
		node.run_state['scripting_language']
	}
	action :install
end
