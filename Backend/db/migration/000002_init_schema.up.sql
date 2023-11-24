-- complaint

CREATE OR REPLACE FUNCTION update_complaint_time()
RETURNS TRIGGER AS $$
BEGIN
    NEW.complaint_time := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_complaint_time_trigger
BEFORE INSERT OR UPDATE ON "complaint"
FOR EACH ROW
EXECUTE FUNCTION update_complaint_time();

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
BEFORE INSERT OR UPDATE ON "accompanyrequest"
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
BEFORE INSERT OR UPDATE ON "hobbyrequest"
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
BEFORE INSERT OR UPDATE ON "loverrequest"
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

