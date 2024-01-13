-- complaint

CREATE OR REPLACE FUNCTION update_contact_time()
RETURNS TRIGGER AS $$
BEGIN
    NEW.contact_at := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_contact_time_trigger
BEFORE INSERT OR UPDATE ON "contact"
FOR EACH ROW
EXECUTE FUNCTION update_contact_time();

-- changetargetuser

CREATE OR REPLACE FUNCTION update_change_time()
RETURNS TRIGGER AS $$
BEGIN
    NEW.change_time := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_change_time_trigger
BEFORE INSERT OR UPDATE ON "changetargetuser"
FOR EACH ROW
EXECUTE FUNCTION update_change_time();

-- targetlist

CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_updated_at_trigger
BEFORE INSERT OR UPDATE ON "targetlist"
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();

-- accompanyrequest

CREATE OR REPLACE FUNCTION update_ac_info_changed_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.info_changed_at := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_accompanyrequest_info_changed_at_trigger
BEFORE INSERT OR UPDATE ON "accompany"
FOR EACH ROW
EXECUTE FUNCTION update_ac_info_changed_at();

-- hobbyrequest

CREATE OR REPLACE FUNCTION update_h_info_changed_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.info_changed_at := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_hobbyrequest_info_changed_at_trigger
BEFORE INSERT OR UPDATE ON "hobby"
FOR EACH ROW
EXECUTE FUNCTION update_h_info_changed_at();

-- loverrequest

CREATE OR REPLACE FUNCTION update_l_info_changed_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.info_changed_at := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_loverrequest_info_changed_at_trigger
BEFORE INSERT OR UPDATE ON "lover"
FOR EACH ROW
EXECUTE FUNCTION update_l_info_changed_at();

-- canchangeinformation

CREATE OR REPLACE FUNCTION update_can_info_changed_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.info_changed_at := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_can_info_changed_at_trigger
BEFORE INSERT OR UPDATE ON "canchangeinformation"
FOR EACH ROW
EXECUTE FUNCTION update_can_info_changed_at();


-- fixinformation

CREATE OR REPLACE FUNCTION update_password_changed_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.password_changed_at := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_password_changed_at_trigger
BEFORE INSERT OR UPDATE ON "fixinformation"
FOR EACH ROW
EXECUTE FUNCTION update_password_changed_at();
