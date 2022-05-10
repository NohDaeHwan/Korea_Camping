package com.nolja.home.command;

import org.springframework.ui.Model;

public interface UserCommand {
	public String userLogin(Model model);
	public String userJoin(Model model);
}
