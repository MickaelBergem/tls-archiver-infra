# Example interesting commands

    select cert_content::jsonb->'SubjectCN' as CN, certificate_idx from certificates where cert_content is not null order by certificate_idx;


    select distinct cert_content::jsonb->'X509Version' as version, count(cert_content) as count from certificates group by cert_content::jsonb->'X509Version' order by count;

    select
        id,
        host,
        cert_content::jsonb->'SubjectCN' as CN,
        cert_content::jsonb->'FingerprintSHA1' as fingerprint,
        timestamp
    from certificates
    where
        cert_content is not null
        and cert_content::jsonb->>'SubjectCN' = 'localhost'
        and certificate_idx=0
        and id>1449633
    order by fingerprint
    limit 30;


    select
        count(id) as count,
        cert_content::jsonb->'SubjectCN' as CN,
        cert_content::jsonb->'FingerprintSHA1' as fingerprint
    from certificates
    where
        cert_content is not null
        and cert_content::jsonb->>'SubjectCN' = 'localhost'
        and certificate_idx=0
        and id>1449633
    group by
        cert_content::jsonb->'FingerprintSHA1',
        cert_content::jsonb->'SubjectCN'
    order by count DESC, CN ASC
    limit 30;
