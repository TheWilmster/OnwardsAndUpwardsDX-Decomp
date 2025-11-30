function return_steam_error_meaning(_error_id)
{
	switch (_error_id)
	{
		case 1:
			return "Success";
			break;
		case 2:
			return "Generic failure";
			break;
		case 3:
			return "No connection\nto Steam";
			break;
		case 4:
			return "Catastrophic\nfailure";
			break;
		case 5:
			return "Invalid password";
			break;
		case 6:
			return "Logged in from\nanother location";
			break;
		case 7:
			return "Protocol version\nincorrect";
			break;
		case 8:
			return "Parameter\nincorrect";
			break;
		case 9:
			return "File not found";
			break;
		case 10:
			return "Busy";
			break;
		case 11:
			return "Invalid state";
			break;
		case 12:
			return "Invalid name";
			break;
		case 13:
			return "Invalid e-mail";
			break;
		case 14:
			return "Duplicate name";
			break;
		case 15:
			return "Access denied";
			break;
		case 16:
			return "Server timeout";
			break;
		case 17:
			return "VAC banned";
			break;
		case 18:
			return "Account not found";
			break;
		case 19:
			return "Steam ID invalid";
			break;
		case 20:
			return "Unavailable";
			break;
		case 21:
			return "Not logged in";
			break;
		case 22:
			return "Result pending";
			break;
		case 23:
			return "Encryption\nfailed";
			break;
		case 24:
			return "Insufficient\nprivileges";
			break;
		case 25:
			return "Limit exceeded";
			break;
		case 26:
			return "Guest pass\nrevoked";
			break;
		case 27:
			return "Expired licence";
			break;
		case 28:
			return "Guest pass has\nbeen redeemed";
			break;
		case 29:
			return "Duplicate\nrequest";
			break;
		case 30:
			return "All passes\nowned";
			break;
		case 31:
			return "IP not found";
			break;
		case 32:
			return "Write failure";
			break;
		case 33:
			return "Access lock\nfailed";
			break;
		case 34:
			return "Login session\nreplaced";
			break;
		case 35:
			return "Can't connect\nto server";
			break;
		case 36:
			return "Authentication\nfailure";
			break;
		case 37:
			return "Generic I/O\nfailure";
			break;
		case 38:
			return "Remote server\ndisconnect";
			break;
		case 39:
			return "Cart not found";
			break;
		case 40:
			return "Action blocked";
			break;
		case 41:
			return "Action ignored";
			break;
		case 42:
			return "No matches";
			break;
		case 43:
			return "Account disabled";
			break;
		case 44:
			return "Service read\nonly";
			break;
		case 45:
			return "No account\nvalue";
			break;
		case 46:
			return "Catastrophic\nfailure";
			break;
		case 47:
			return "Version mismatch";
			break;
		case 48:
			return "Current CM busy";
			break;
		case 49:
			return "Logged in from\nanother location";
			break;
		case 50:
			return "Catastrophic\nfailure";
			break;
		case 51:
			return "Operation paused";
			break;
		case 52:
			return "Operation\ncancelled";
			break;
		case 53:
			return "Data invalid";
			break;
		case 54:
			return "Disk too full";
			break;
		case 55:
			return "Remote call\nfailure";
			break;
		case 56:
			return "Unset password\n(this is my fault)";
			break;
		case 57:
			return "External acc.\nnot linked";
			break;
		case 58:
			return "PSN ticket\ninvalid";
			break;
		case 59:
			return "External acc\nalready linked";
			break;
		case 60:
			return "File conflict";
			break;
		case 61:
			return "Bad new\npassword";
			break;
		case 62:
			return "Duplicate\nanswer";
			break;
		case 63:
			return "2FA failure";
			break;
		case 64:
			return "Bad new\npassword";
			break;
		case 65:
			return "2FA invalid";
			break;
		case 66:
			return "2FA invalid; unable\nto send e-mail";
			break;
		case 67:
			return "IPT not\nsupported";
			break;
		case 68:
			return "IPT init\nfailure";
			break;
		case 69:
			return "Restricted by\nparental controls";
			break;
		case 70:
			return "Facebook query\nerror";
			break;
		case 71:
			return "Expired 2FA code";
			break;
		case 72:
			return "IP restricted";
			break;
		case 73:
			return "Account\nlockdown";
			break;
		case 74:
			return "Unverified\ne-mail";
			break;
		case 75:
			return "No matching URL";
			break;
		case 76:
			return "Bad response";
			break;
		case 77:
			return "Password re-entry\nis required";
			break;
		case 78:
			return "Domain error";
			break;
		case 79:
			return "Catastrophic\nfailure";
			break;
		case 80:
			return "Service disabled";
			break;
		case 81:
			return "Invalid CEG\nsubmission";
			break;
		case 82:
			return "Device not\nallowed";
			break;
		case 83:
			return "Action is\nregion locked";
			break;
		case 84:
			return "You are being\nrate limited";
			break;
		case 85:
			return "2FA required";
			break;
		case 86:
			return "Say to the bulkly\nitem byebye";
			break;
		case 87:
			return "Response\nthrottled";
			break;
		case 88:
			return "Wrong 2FA code";
			break;
		case 89:
			return "2FA code mismatch";
			break;
		case 90:
			return "Multiple people\nassociated w/ acc.";
			break;
		case 91:
			return "Data was not\nmodified";
			break;
		case 92:
			return "No mobile device";
			break;
		case 93:
			return "Time synchronisation\nerror";
			break;
		case 94:
			return "SMS code failure";
			break;
		case 95:
			return "Account access\nlimit exceeded";
			break;
		case 96:
			return "Account activity\nlimit exceeded";
			break;
		case 97:
			return "Phone activity\nlimit exceeded";
			break;
		case 98:
			return "Wallet is\nrequire";
			break;
		case 99:
			return "E-mail could not\nbe sent";
			break;
		case 100:
			return "Payment not\nsettled";
			break;
		case 101:
			return "Invalid CAPTCHA";
			break;
		case 102:
			return "Login token\nbanned";
			break;
		case 103:
			return "Server owner\ndenied";
			break;
		case 104:
			return "Invalid item\ntype";
			break;
		case 105:
			return "IP banned";
			break;
		case 106:
			return "Token expired";
			break;
		case 107:
			return "Insufficient\nfunds";
			break;
		case 108:
			return "Too many of\nthis pending";
			break;
		case 251:
			return "Terms of Service\nnot accepted";
			break;
		case 252:
			return "Error setting\nname";
			break;
		case 253:
			return "Error setting\ndescription";
			break;
		case 254:
			return "Error setting\nvisibility";
			break;
		case 255:
			return "Error finding\nlevel";
			break;
		default:
			return "Catastrophic\nfailure";
			break;
	}
}
