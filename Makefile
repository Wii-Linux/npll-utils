DESTDIR ?= $(PWD)/install

.PHONY: install
install:
	mkdir -p $(DESTDIR)/usr/bin $(DESTDIR)/usr/lib/npll $(DESTDIR)/etc/npll.d $(DESTDIR)/etc/default
	find etc usr -type f -exec sh -c 'f="{}"; echo "$$f"; mode=$$(stat -c "%a" "$$f"); install -Dm $$mode "$$f" "$(DESTDIR)/$$f"' \;
	cp npll-install update-npll npll-mkconfig npll-migrate $(DESTDIR)/usr/bin/
